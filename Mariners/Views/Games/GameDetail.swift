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
    @State private var events = ModelData().score.game.away.events
    @State private var showLoading: Bool = true
    var gameID: String
    
    var body: some View {
        List {
            GameRow(game: game) // showLoading: $showLoading
            VStack {
                HStack {
                    Text(game.away.name)
                        .font(.caption)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(game.home.name)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                HStack {
                    Text(String(game.away.win) + "-" + String(game.away.loss))
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(String(game.home.win) + "-" + String(game.home.loss))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            BoxscoreItem(showLoading: $showLoading, game: game)
//            Divider()
            ScoringList(away: game.away.abbr, home: game.home.abbr, events: mergeEvents(game.away.events ?? [Event](), game.home.events ?? [Event]()))
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
//        .redacted(reason: showLoading ? .placeholder : [])
//        .listRowInsets(EdgeInsets())
        .listStyle(.inset)
        .navigationTitle(game.away.abbr + " @ " + game.home.abbr)
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
            showLoading = true
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let gameBoxscore = try? JSONDecoder().decode(GameBoxscore.self, from: jsonData) {
                game = gameBoxscore.game
                print("GameDetail JSON decoded.")
                showLoading = false
            }
        } catch {
            print("Invalid GameDetail data")
        }
    }
}

struct GamesDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameDetail(gameID: "00cb0901-a2c1-411a-8884-f03190a54e8a")
            .environmentObject(ModelData())
    }
}
