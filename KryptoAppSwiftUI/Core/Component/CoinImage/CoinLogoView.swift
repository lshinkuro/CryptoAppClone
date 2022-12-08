//
//  CoinLogoView.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 07/12/22.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin : CoinModel
    
    var body: some View {
        VStack {
            CoinImageView(coin: coin).frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(.green)
                .lineLimit(1).minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.headline)
                .foregroundColor(.gray)
                .lineLimit(2)
                .lineLimit(1).minimumScaleFactor(0.5)
        }
    }
}

struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CoinLogoView(coin: dev.coin).previewLayout(.sizeThatFits)
    }
}
