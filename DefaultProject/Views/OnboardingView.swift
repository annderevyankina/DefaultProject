//
//  OnboardingView.swift
//  DefaultProject
//
//  Created by Анна on 06.11.2024.
//

import SwiftUI

struct OnboardingView: View {
    let pages: [OnboardingData] // Массив данных
    @Binding var currentPage: Int // Текущая страница
    var onCompleted: () -> Void // Замыкание для завершения онбординга
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<pages.count, id: \.self) { index in
                    OnboardingPageView(data: pages[index]) // Отображение каждой страницы
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            HStack {
                if currentPage > 0 {
                    Button("Назад") {
                        currentPage -= 1
                    }
                }
                Spacer()
                if currentPage < pages.count - 1 {
                    Button("Далее") {
                        currentPage += 1
                    }
                } else {
                    Button("Завершить") {
                        onCompleted()  // Завершаем онбординг
                    }
                }
            }
            .padding()
        }
    }
}


