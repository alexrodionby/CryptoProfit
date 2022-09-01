//
//  PreviewProvider.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 29.08.22.
//

// MARK: Это дополнение к превью наших вьюшек, чтобы не передавать туда каждый раз данные, а брать отсюда

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

// MARK: Синглтон для превью, который нужен нам только для разработки

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() {}
    
    let homeVM = HomeViewModel()
    
    let coin = CoinModel(id: "bitcoin",
                         symbol: "btc",
                         name: "Bitcoin",
                         image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                         currentPrice: 19839.5,
                         marketCap: 380138279067,
                         marketCapRank: 1,
                         fullyDilutedValuation: 417178113287,
                         totalVolume: 24599581545,
                         high24H: 20150,
                         low24H: 19617.3,
                         priceChange24H: -170.19785089107245,
                         priceChangePercentage24H: -0.85058,
                         marketCapChange24H: -2844895887.557556,
                         marketCapChangePercentage24H: -0.74283,
                         circulatingSupply: 19135481,
                         totalSupply: 21000000,
                         maxSupply: 21000000,
                         ath: 69045,
                         athChangePercentage: -71.25,
                         athDate: "2021-11-10T14:24:11.849Z",
                         atl: 67.81,
                         atlChangePercentage: 29173.94677,
                         atlDate: "2013-07-06T00:00:00.000Z",
                         lastUpdated: "2022-08-29T10:24:30.584Z",
                         sparklineIn7D: SparklineIn7D(price: [
                            21455.853253963316,
                            21358.650857679924,
                            21192.23133210945,
                            21144.5903334789,
                            21191.65149834661]),
                         priceChangePercentage24HInCurrency: -0.8505769102739783,
                         currentHoldings: 1.5)
    
}
