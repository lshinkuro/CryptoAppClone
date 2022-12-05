//
//  CoinRowsView.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import SwiftUI

struct CoinRowsView: View {
     
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        
        ZStack {
            Color.black.background().ignoresSafeArea()
            HStack(spacing: 0){
                leftColumn
                Spacer()
                if showHoldingsColumn {
                   centerColumn
                }
                rightColumn
            }.cornerRadius(20)
            .padding(.horizontal)
            .font(.subheadline)
        }
    }
}

struct CoinRowsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowsView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            CoinRowsView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}

extension CoinRowsView {
    private var leftColumn: some View {
        HStack {
            Text(coin.symbol.uppercased())
                .font(.caption)
                .foregroundColor(Color.white)
                .frame(minWidth: 30)
            CoinImageView(coin: coin).frame(width: 30, height: 30)
            Text(coin.name)
                .font(.headline)
                .padding(.leading, 3)
                .foregroundColor(Color.gray)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing){
            Text(coin.high24H.asCurrencyWith2Digit()).bold()
                .foregroundColor(.accentColor)
            Text(coin.marketCapChangePercentage24H.asPercentString()) .foregroundColor(.green)
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice?.asCurrencyWithSixDigit() ?? "")
                .bold()
                .foregroundColor(.gray)
            Text(coin.priceChangePercentage24H.asPercentString()).foregroundColor(coin.priceChangePercentage24H >= 0 ? Color.red : Color.green)
        }.padding(.trailing, 20)
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
