//
//  HomeViewModel.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    
    @Published var statModel: [StatisticModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var portofolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        /*get coins if not filter */
        //        dataService.$allCoins
        //            .sink(receiveValue: { [weak self] (returnedCoins) in
        //                guard let self = self else {
        //                    return
        //                }
        //                self.allCoins = returnedCoins
        //                self.portofolioCoins = self.allCoins.sorted{ $0.name > $1.name}
        //            }).store(in: &cancellables)
        
        // observer combine text and all coins and filtering
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filteringCoins)
            .sink(receiveValue: { [weak self] (returnedValue) in
                guard let self = self else {
                    return
                }
                self.allCoins = returnedValue
                self.portofolioCoins = self.allCoins.sorted{ $0.name > $1.name}
            }).store(in: &cancellables)
        
        marketDataService
            .$marketData
            .map(mapGlobalMarketData)
            .sink(receiveValue: { [weak self] (returnedValue) in
                guard let self = self else {
                    return
                }
                self.statModel = returnedValue
            }).store(in: &cancellables)
        
    }
    
    func filteringCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else { return coins }
        let lowecasedText = text.lowercased()
        return coins.filter {(coin) -> Bool in
            return coin.name.lowercased().contains(lowecasedText) ||
            coin.id.lowercased().contains(lowecasedText) ||
            coin.symbol.lowercased().contains(lowecasedText)
        }
    }
    
    func mapGlobalMarketData(data: MarketDataModel?) -> [StatisticModel] {
        var statisticData: [StatisticModel] = []
        
        guard let data = data else { return statisticData }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "Btc Dominance", value: data.btcDominance)
        let portofolio =  StatisticModel(title: "Portofolio", value: data.marketCap, percentageChange: 10)
        
        statisticData.append(contentsOf: [marketCap,volume,btcDominance,portofolio])
        
        return statisticData
    }
    
    func downloadData() {
        
    }
}
