//
//  CardListView.swift
//  DefaultProject
//
//  Created by Анна on 13.11.2024.
//

import Foundation
import SwiftUI

struct CardListView: View {
    @State private var cards: [Card] = [
        Card(title: "Card 1", description: "Description for card 1", tags: ["Tag1", "Tag2"]),
        Card(title: "Card 2", description: "Description for card 2", tags: ["Tag3"]),
    ]
    @State private var showModal = false
    @State private var selectedTag: String = "All" // Начальный тег для фильтрации
    @State private var searchText: String = "" // Текст для поиска
    
    var filteredCards: [Card] {
        // Фильтрация по тегу
        let filteredByTag = selectedTag == "All"
            ? cards
            : cards.filter { $0.tags.contains(selectedTag) }
        
        // Фильтрация по тексту поиска
        if searchText.isEmpty {
            return filteredByTag
        } else {
            return filteredByTag.filter {
                $0.title.contains(searchText) || $0.description.contains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Picker для выбора тега
                Picker("Filter by Tag", selection: $selectedTag) {
                    Text("All").tag("All")
                    ForEach(cards.flatMap { $0.tags }, id: \.self) { tag in
                        Text(tag).tag(tag)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // TextField для поиска
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Список карточек, отфильтрованных по тегу и поисковому запросу
                List {
                    ForEach(filteredCards) { card in
                        CardView(card: card) // Используем CardView для отображения карточки
                            .onTapGesture {
                                // Открытие детального просмотра карточки
                            }
                    }
                    .onDelete(perform: deleteCard) // Возможность удаления карточек
                }
            }
            .navigationBarTitle("Cards")
            .navigationBarItems(trailing: Button(action: {
                showModal.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showModal) {
                AddCardView(cards: $cards)
            }
        }
    }
    
    // Метод для удаления карточек
    private func deleteCard(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
    }
}

struct AddCardView: View {
    @Binding var cards: [Card]
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var tags: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Card Information")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    TextField("Tags (comma separated)", text: $tags)
                }
                
                Button("Add Card") {
                    let tagList = tags.split(separator: ",").map {
                        String($0).trimmingCharacters(in: .whitespaces)
                    }
                    
                    let newCard = Card(title: title, description: description, tags: tagList)
                    cards.append(newCard)
                }
            }
            .navigationBarTitle("Add Card")
            .navigationBarItems(trailing: Button("Done") {
                // Закрытие модального окна
            })
        }
    }
}
