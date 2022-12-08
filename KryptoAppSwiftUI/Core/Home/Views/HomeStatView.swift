//
//  HomeStatView.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 07/12/22.
//

import SwiftUI

struct HomeStatView: View {
    
    @EnvironmentObject var vm : HomeViewModel
    
    @Binding var showPortofolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statModel) { stat in
                    StatisticView(stat: stat)
             }.frame(width: UIScreen.main.bounds.width / 3)
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortofolio ? .trailing : .leading)
    }
}

struct HomeStatView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatView(showPortofolio: .constant(true))
            .environmentObject(dev.homeVm)
            .previewLayout(.sizeThatFits)
    }
}
