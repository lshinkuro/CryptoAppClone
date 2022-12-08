//
//  PrefiewProviderExt.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import SwiftUI
import Foundation

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    init() {}
    
    let state1  = StatisticModel(title: "MarketcCap", value: "$12.50Bt", percentageChange: 20.4)
    let state2  = StatisticModel(title: "Marketc24H", value: "$13.50Bn")
    let state3  = StatisticModel(title: "Marketc24H", value: "$13.50Tr")


    let coin: CoinModel = .mock
    let homeVm = HomeViewModel()
}


extension CoinModel {
    static var mock: CoinModel {
        // swiftlint:disable all
        let json = try! JSONDecoder().decode(CoinModel.self, from: json.data(using: .utf8)!)
        return json
    }
    
    static var json = """
 {
  "id": "ethereum",
  "symbol": "eth",
  "name": "Ethereum",
  "image": "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
  "current_price": 1261.39,
  "market_cap": 152002106549,
  "market_cap_rank": 2,
  "fully_diluted_valuation": 152002106549,
  "total_volume": 5017098237,
  "high_24h": 1278.32,
  "low_24h": 1240.51,
  "price_change_24h": -13.44841556498909,
  "price_change_percentage_24h": -1.05491,
  "market_cap_change_24h": -1890790087.685852,
  "market_cap_change_percentage_24h": -1.22864,
  "circulating_supply": 120522012.389997,
  "total_supply": 120522012.389997,
  "max_supply": null,
  "ath": 4878.26,
  "ath_change_percentage": -74.23217,
  "ath_date": "2021-11-10T14:24:19.604Z",
  "atl": 0.432979,
  "atl_change_percentage": 290219.41039,
  "atl_date": "2015-10-20T00:00:00.000Z",
  "roi": {
    "times": 98.06092400119105,
    "currency": "btc",
    "percentage": 9806.092400119105
  },
  "last_updated": "2022-12-04T08:38:04.261Z"
}
"""
}

