//
//  HomeViewModel.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portofolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portofolioCoins.append(DeveloperPreview.instance.coin)

        }
    }
}
