//
//  HomeView.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 28.08.22.
//

// MARK: Основной домашний экран

import SwiftUI

struct HomeView: View {
    
    // Флаг, показывать или нет экран Portfolio
    @State private var showPortfolio: Bool = false
    
    // Добавляем сюда нашу модель данных как enviromenObject
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack {
            // Задний слой
            Color.theme.background
                .ignoresSafeArea()
            
            // Контент слой
            VStack {
                // Вставляем переменную с хедером
                homeHeader
                // Переменная с названием колонок
                columnTitles
                
                if !showPortfolio {
                    // Список всех монеток
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    // Список монет в портфолио
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(dev.homeVM)
    }
}

// MARK: Делаем расширение для HomeView, в котором создаем переменную с верхним хедером, который потом вставляем в основное вью, а так же другие переменные с вью

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none, value: showPortfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    // Список всех монеток
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .listRowBackground(Color.theme.background)
            }
        }
        .listStyle(.plain)
    }
    
    // Список монет в портфолио
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .listRowBackground(Color.theme.background)
            }
        }
        .listStyle(.plain)
    }
    
    // Название колонок
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
}
