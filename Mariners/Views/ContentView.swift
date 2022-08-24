//
//  ContentView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import SwiftUI

//extension View {
//    func toAnyView() -> AnyView {
//        AnyView(self)
//    }
//}

struct ContentView: View {
    @State private var selection: Tab = .home
    @State private var showLoading: Bool = false
//    @EnvironmentObject var sessionManager: SessionManager
//    @StateObject var viewModel = ViewModel()
    
//    var currentUser: User? {
//        sessionManager.currentUser
//    }
    
    enum Tab {
        case home
        case shop
        case tweets
        case twitter
        case test
        case standings
        case scores
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView(showLoading: $showLoading)
                .environmentObject(ModelData())
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.home)
            
//            WebView(url: URL(string:"https://www.mlbshop.com/seattle-mariners/t-14893351+z-9767467-794195422")!, showLoading: $showLoading)
//                .overlay(showLoading ? ProgressView().toAnyView() : EmptyView().toAnyView())
//                .tabItem {
//                   Label("Shop", systemImage: "tshirt.fill")
//                }
//                .tag(Tab.shop)
//            
//            WebView(url: URL(string:"https://www.twitter.com")!, showLoading: $showLoading)
//                .tabItem {
//                   Label("Twitter", systemImage: "newspaper.fill")
//                }
//                .tag(Tab.twitter)
            
//            ResponseView()
//                .tabItem {
//                   Label("Test", systemImage: "gearshape.fill")
//                }
//                .tag(Tab.test)
            
            StandingsView()
                .tabItem {
                   Label("Standings", systemImage: "list.number")
                }
                .tag(Tab.standings)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
