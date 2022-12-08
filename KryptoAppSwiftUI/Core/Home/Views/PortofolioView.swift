//
//  PortofolioView.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 07/12/22.
//

import SwiftUI

struct PortofolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    
                    if selectedCoin != nil {
                      portofolioInputSection
                    }
                    
                }
            }.navigationTitle("Edit Portofolio")
             .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        XMarkButton()
                    }
                 ToolbarItem(placement: .navigationBarTrailing) {
                    checkMarkButton
                 }
                })
        }
    }
}

struct PortofolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortofolioView().environmentObject(dev.homeVm)
    }
}

extension PortofolioView {
    
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 4) {
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                selectedCoin = coin
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ?
                                        .green : .clear
                                    , lineWidth: 1)
                        }
                }
            }
            .padding(.vertical, 4)
            .padding(.leading)
        }
    }
    
    func getValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var  portofolioInputSection: some View {
        withAnimation(.none) {
            VStack(spacing: 20) {
                HStack {
                    Text("Current Price of \(selectedCoin?.symbol.uppercased() ?? "") : ")
                    Spacer()
                    Text(selectedCoin?.currentPrice?.asCurrencyWithSixDigit() ?? "")
                }
                Divider()
                HStack {
                    Text("Amount of portofolio : ")
                    Spacer()
                    TextField("ext.14", text: $quantityText)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)

                }
                Divider()
                HStack {
                    Text("Current Value : ")
                    Spacer()
                    Text(getValue().asCurrencyWith2Digit())
                }
            }
            .font(.headline)
            .padding()
        }
    
    }
    
    private var checkMarkButton : some View {
        HStack (spacing: 10){
            Image(systemName: "checkmark").opacity(showCheckmark ? 1.0 : 0.0)
            Button(action: {
                saveButtonPressed()
            }, label: {
                Text("Save".uppercased())
            }).opacity(selectedCoin != nil && selectedCoin?.currentPrice != Double(quantityText) ?  1.0 : 0.0)
        }.font(.headline)
    }
    
    private func saveButtonPressed() {
        guard let coin = selectedCoin else {return}
        
        //show checkmark
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelectedCoin()
        }
        //hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
      
        
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
    
}

