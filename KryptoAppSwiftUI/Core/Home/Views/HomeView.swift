//
//  HomeView.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    @State var showPortofolio: Bool = false
    var body: some View {
        ZStack {
            Color
                .accentColor
                .background().ignoresSafeArea()
            VStack {
                homeView
                HStack {
                    Text("Coins")
                    Spacer()
                    if !showPortofolio {
                        Text("Holding Price")
                    }
                    Text("Price").frame(width: UIScreen.main.bounds.width/3)
                    
                }.font(.caption).foregroundColor(Color.white).padding(.horizontal)
                
                if !showPortofolio {
                   allCoinsList.transition(.move(edge: .leading))
                } else {
                    portofolioCoinsList.transition(.move(edge: .trailing))
                }
              
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }.environmentObject(dev.homeVm)
    }
}

extension HomeView {
    private var homeView: some View {
            HStack {
                CircleButton(iconName: showPortofolio ? "plus" : "info")
                    .animation(.none, value: 4)
                    .background(
                        CircleButtonAnimation(animate: $showPortofolio)
                    )
                Spacer()
                Text( showPortofolio ? "Portofolio" : "Live Prices")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer()
                CircleButton(iconName: "chevron.right")
                    .rotationEffect(Angle(degrees: showPortofolio ? 180 : 0))
                    .onTapGesture {
                        withAnimation(
                            Animation.spring(blendDuration: 4)
                        ) {
                            showPortofolio.toggle()
                        }
                    }
            }.padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(homeViewModel.allCoins) { item in
                CoinRowsView(coin: item, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.cornerRadius(10)
         .padding(.horizontal)
         .listStyle(PlainListStyle())
    }
    
    private var portofolioCoinsList: some View {
        List {
            ForEach(homeViewModel.portofolioCoins) { item in
                CoinRowsView(coin: item, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.cornerRadius(10)
         .padding(.horizontal)
         .listStyle(PlainListStyle())
    }
}


