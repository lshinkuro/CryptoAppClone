//
//  CoinImageViewModel.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 05/12/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
     
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()

    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.isLoading = true
        addSubscriber()
    }
    
    func addSubscriber() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                guard let self = self else { return }
                self.image = returnedImage
            }.store(in: &cancellables)
    }
}
