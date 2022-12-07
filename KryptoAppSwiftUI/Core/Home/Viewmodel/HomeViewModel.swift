//
//  HomeViewModel.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portofolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        dataService.$allCoins
            .sink(receiveValue: { [weak self] (returnedCoins) in
                guard let self = self else {
                    return
                }
                self.allCoins = returnedCoins
                self.portofolioCoins = self.allCoins.sorted{ $0.name > $1.name}
            }).store(in: &cancellables)
        
    }
    
    func downloadData() {
        
    }
}
