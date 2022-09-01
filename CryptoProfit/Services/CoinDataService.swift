//
//  CoinDataService.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 31.08.22.
//

// MARK: Сервис для получения всех монеток

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?   // Подписка, которую мы легко можем удалить
    
    init() {
        getCoins()  // Сработает сразу на инициализации класса
    }
    
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        // Делаем через привязку к отменяемой переменной паблишеру
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder()) // Декодируем в тип CoinModel декодером JSON
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins          // Сохраняем полученные данные
                self?.coinSubscription?.cancel()        // Отменяем подписку на паблишера
            })
    }
}
