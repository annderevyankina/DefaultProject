//
//  MainTabView.swift
//  DefaultProject
//
//  Created by Анна on 13.11.2024.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Вкладка с карточками
            ContentView()  // Экран с карточками
                .tabItem {
                    Image(systemName: "list.bullet")  // Иконка для карточек
                    Text("Cards")  // Название вкладки
                }
            
            // Вкладка с профилем
            ProfileView()  // Экран с профилем
                .tabItem {
                    Image(systemName: "person.circle")  // Иконка для профиля
                    Text("Profile")  // Название вкладки
                }
        }
    }
}
