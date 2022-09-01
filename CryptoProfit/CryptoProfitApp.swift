//
//  CryptoProfitApp.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 28.08.22.
//

import SwiftUI

@main
struct CryptoProfitApp: App {
    
    // Добавляем нашу вью модель как стейт обжект и передаем потом ее всей группе вьюшек
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)  // Передали всему стеку нашу модель
        }
    }
}
