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
    
    var body: some View {
        List {
            GameRow(game: game)
            Divider()
            BoxscoreItem(game: game)
            Divider()
        }
        .listRowInsets(EdgeInsets())
        .listStyle(.inset)
        .refreshable {
            await loadData()
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/games/00cb0901-a2c1-411a-8884-f03190a54e8a/boxscore.json?api_key=wnfa3bdarch3hxhh8jv64znu") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let gameBoxscore = try? JSONDecoder().decode(GameBoxscore.self, from: jsonData) {
                game = gameBoxscore.game
                print("game JSON decoded.")
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct GamesDetail_Previews: PreviewProvider {
    static var previews: some View {
//        GameDetail(game: ModelData().scores.league.games[0].game)
        GameDetail()
            .environmentObject(ModelData())
    }
}
