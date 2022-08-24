//
//  GameList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import SwiftUI

struct GameList: View {
    @EnvironmentObject var modelData: ModelData
//    @State private var games = [GameElement]()
    @State private var games = ModelData().scores.league.games
//    @State private var isLoading = true
    @State private var showLoading: Bool = true
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            ForEach(games) { game in
                NavigationLink {
                    GameDetail(gameID: game.game.id)
                } label: {
                    BoxscoreRow(showLoading: $showLoading, game: game.game)
                }
                .padding()
                Divider()
            }
        }
        .listRowInsets(EdgeInsets())
        .listStyle(.inset)
        
        .navigationTitle("Scores")
        .refreshable {
            await loadData()
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/games/2022/08/19/boxscore.json?api_key=wnfa3bdarch3hxhh8jv64znu") else {
            print("Invalid URL")
            return
        }
        
        do {
            showLoading = true
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let box_scores = try? JSONDecoder().decode(DailyBoxscore.self, from: jsonData) {
                games = box_scores.league.games
                print("JSON decoded.")
                showLoading = false
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
            .environmentObject(ModelData())
    }
}
