//
//  GameList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import SwiftUI

struct GameList: View {
    @EnvironmentObject var globalVariables: GlobalVariables
    @ObservedObject var viewModel = GamesViewModel()
//    @State private var games = ModelData().scores.league.games
    @State private var showLoading: Bool = true
    
    var body: some View {
        List {
            DateView()
                .environmentObject(globalVariables)
            ForEach(viewModel.scores.league.games) { game in
                NavigationLink {
                    GameDetail(gameID: game.game.id)
                } label: {
                    BoxscoreSimple(game: game.game)
                }
                .padding()
                Divider()
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
        .navigationTitle("Scores")
        .redacted(reason: showLoading ? .placeholder : [])
        .refreshable {
            showLoading = true
            print(getDateComponents(globalVariables.myDate))
            viewModel.getData(date: getDateComponents(globalVariables.myDate))
            showLoading = false
        }
        .task {
            showLoading = true
            print(getDateComponents(globalVariables.myDate))
            viewModel.getData(date: getDateComponents(globalVariables.myDate))
            showLoading = false
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
            .environmentObject(ModelData())
            .environmentObject(GlobalVariables())
    }
}
