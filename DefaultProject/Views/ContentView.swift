//
//  ContentView.swift
//  DefaultProject
//
//  Created by Анна on 06.11.2024.
//

import SwiftUI

struct ContentView: View {
    // Массив данных для онбординга
    let pages = [
        OnboardingData(id: UUID(), image: "img1", title: "Добро пожаловать!", description: "Откройте для себя приложение."),
        OnboardingData(id: UUID(), image: "img2", title: "Функции", description: "Узнайте о полезных функциях."),
        OnboardingData(id: UUID(), image: "img3", title: "Начнем", description: "Давайте начнем!")
    ]
    
    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    var body: some View {
        VStack {
            if hasSeenOnboarding {
                // Показываем экран авторизации после завершения онбординга
                LoginView()
            } else {
                // Передаем текущую страницу в OnboardingView
                OnboardingView(pages: pages, currentPage: $currentPage, onCompleted: {
                    hasSeenOnboarding = true // Завершаем онбординг
                })
            }
        }
    }
}



#Preview {
    ContentView()
}
