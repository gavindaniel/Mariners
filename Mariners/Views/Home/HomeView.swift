//
//  HomeView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import SwiftUI
//import Amplify

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var globalVariables: GlobalVariables
    @State private var showingSettings = false
    
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    ScrollView(showsIndicators: true) {
                        ScoreFeatured(game: ModelData().scores.league.games[0].game)
                            .environmentObject(globalVariables)
                        .listRowInsets(EdgeInsets())
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.top, 10)
                
                VStack(alignment: .leading) {
                    ScrollView(showsIndicators: true) {
                        HeadlineList()
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.top, 50)
                
                VStack(alignment: .leading) {
                    ScrollView(showsIndicators: true) {
                        TweetCardRow(tweets: modelData.tweets)
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.top, 50)
                .padding(.bottom, 25)
            }
            .listStyle(.inset)
            .navigationTitle("Home")
            .toolbar {
                Button {
                    showingSettings.toggle()
                } label: {
                    Label("User Settings", systemImage: "gearshape.fill")
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsHost()
                    .environmentObject(modelData)
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    @State private var showLoading: Bool = false
    static var previews: some View {
        HomeView()
            .environmentObject(ModelData())
            .environmentObject(GlobalVariables())
    }
}
