//
//  GameDetail.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import SwiftUI

struct GameDetail: View {
    @EnvironmentObject var modelData: ModelData
    @State private var game = ModelData().score.game
    @State var isLoading: Bool
    var gameID: String
    
    var body: some View {
        List {
            GameRow(isLoading: isLoading, game: game)
//            Divider()
            BoxscoreItem(isLoading: isLoading, game: game)
//            Divider()
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
//        .listRowInsets(EdgeInsets())
        .listStyle(.inset)
        .navigationTitle("Boxscore")
        .refreshable {
            await loadData()
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/games/\(gameID)/boxscore.json?api_key=wnfa3bdarch3hxhh8jv64znu") else {
            print("Invalid URL")
            return
        }
        
        do {
            isLoading = true
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let gameBoxscore = try? JSONDecoder().decode(GameBoxscore.self, from: jsonData) {
                game = gameBoxscore.game
                print("game JSON decoded.")
                isLoading = false
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct GamesDetail_Previews: PreviewProvider {
    static var previews: some View {
//        GameDetail(game: ModelData().scores.league.games[0].game)
        GameDetail(isLoading: false, gameID: "00cb0901-a2c1-411a-8884-f03190a54e8a")
            .environmentObject(ModelData())
    }
}
