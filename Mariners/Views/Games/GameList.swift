//
//  GameList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import SwiftUI

struct GameList: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var globalVariables: GlobalVariables
    @ObservedObject var viewModel = GamesViewModel()
    @State private var games = ModelData().scores.league.games
    @State private var showLoading: Bool = true
    
    var body: some View {
        List {
            DateView()
            ForEach(games) { game in
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
            await loadData()
//            viewModel.getData()
        }
        .task {
            await loadData()
//            viewModel.getData()
        }
    }
    
    func loadData() async {
        print("/\(getDateComponent(globalVariables.myDate, "Y"))/\(getDateComponent(globalVariables.myDate, "M"))/\(getDateComponent(globalVariables.myDate, "D"))/")
        guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/games/\(getDateComponent(globalVariables.myDate, "Y"))/\(getDateComponent(globalVariables.myDate, "M"))/\(getDateComponent(globalVariables.myDate, "D"))/boxscore.json?api_key=\(globalVariables.keys.sport_radar)") else {
            print("Invalid URL")
            return
        }
        
        do {
            showLoading = true
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let box_scores = try? JSONDecoder().decode(DailyBoxscore.self, from: jsonData) {
                games = box_scores.league.games
                print("GameList JSON decoded.")
                showLoading = false
            }
        } catch {
            print("Invalid GameList data")
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
