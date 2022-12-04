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
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingsColumn {
               centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowsView(coin: dev.coin, showHoldingsColumn: true).previewLayout(.sizeThatFits)
            
            CoinRowsView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}

extension CoinRowsView {
    private var leftColumn: some View {
        HStack {
            Text(coin.symbol)
                .font(.caption).foregroundColor(Color.cyan).frame(minWidth: 30)
            Circle().frame(width: 30, height: 30)
            Text(coin.name)
                .font(.headline).padding(.leading, 6).foregroundColor(Color.accentColor)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .leading){
            Text(coin.high24H.asCurrencyWith2Digit()).bold()
            Text(coin.marketCapChangePercentage24H.asPercentString())
        }.foregroundColor(.accentColor)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice?.asCurrencyWithSixDigit() ?? "")
                .bold()
                .foregroundColor(.gray)
            Text(coin.priceChangePercentage24H.asPercentString()).foregroundColor(coin.priceChangePercentage24H >= 0 ? Color.red : Color.green)
        }.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
