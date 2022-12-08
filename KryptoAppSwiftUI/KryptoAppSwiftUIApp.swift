//
//  KryptoAppSwiftUIApp.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import SwiftUI

@main
struct KryptoAppSwiftUIApp: App {
    
    @StateObject private var homeViewModel: HomeViewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.green)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.green)]
    }

    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView().toolbar(.hidden)
            }.environmentObject(homeViewModel)
        }
    }
}
