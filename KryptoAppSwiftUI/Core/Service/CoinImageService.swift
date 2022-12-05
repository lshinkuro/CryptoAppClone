//
//  CoinImageService.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 05/12/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
            image = savedImage
            print("retrieve image from file manager 😊")
        } else {
            downloadCoinImage()
            print("downloading image 😩" )
        }
    }
    
    func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({(data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedData = returnedImage else { return }
                self.image = downloadedData
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedData, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
