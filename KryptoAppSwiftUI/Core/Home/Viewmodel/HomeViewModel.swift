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
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portofolioCoins.append(DeveloperPreview.instance.coin)

        }
        addSubscriber()
    }
    
    func addSubscriber() {
        dataService.$allCoins
            .sink(receiveValue: { [weak self] (returnedCoins) in
                guard let self = self else {
                    return
                }
                self.allCoins = returnedCoins
            }).store(in: &cancellables)
    }
    
    func downloadData() {
        
    }
}
