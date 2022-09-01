//
//  HomeViewModel.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 31.08.22.
//

// MARK: Наша дата вью модель для получения данных через запросы

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    // Создаем экземпляр нашего сервиса для получения монет
    private let dataService = CoinDataService()
    
    // Тут создаем это массив чисто для правильности. Удалять подписки можно будет по той переменной в сервисе
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    // Тут мы подписываемся на паблишера из сервиса и возвращаем его данные в нашу модель
    // В комбайне это делается через подписку sink
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
}
