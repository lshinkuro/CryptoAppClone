//
//  MarketDataService.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 07/12/22.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    
    var marketSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global" )
        else { return }
        
        marketSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                guard let self = self else { return }
                self.marketData = returnedGlobalData.data
                self.marketSubscription?.cancel()
            })
    }
}
