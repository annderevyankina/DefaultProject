//
//  DefaultProjectApp.swift
//  DefaultProject
//
//  Created by Анна on 06.11.2024.
//

import SwiftUI

@main
struct DefaultProjectApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false  // Храним состояние авторизации

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainTabView()  // Показать MainTabView после авторизации
            } else {
                LoginView()  // Показать экран авторизации
            }
        }
    }
}
