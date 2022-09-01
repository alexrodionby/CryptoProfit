//
//  CoinImageViewModel.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 1.09.22.
//

// MARK: Вьюмодель для картинки монетки

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    // Картинка-лого монетки
    @Published var image: UIImage? = nil
    
    // Флаг, грузится или нет лого монетки
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
    
}
