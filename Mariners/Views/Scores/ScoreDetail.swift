//
//  ScoreDetail.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import SwiftUI

struct ScoreDetail: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var globalVariables: GlobalVariables
    @State private var game = ModelData().score.game
    @State private var events = ModelData().score.game.away.events
    @State private var showLoading: Bool = true
    var gameID: String
    
    var body: some View {
        List {
            ScoreRow(game: game)
                .padding(.top, 15)
                .listRowInsets(EdgeInsets())
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
            .listRowInsets(EdgeInsets())
            .padding(10)
            .listRowSeparator(.hidden)
            LineScoreFull(game: game)
                .listRowSeparator(.hidden)
                .padding(.top, 15)
                .padding(.bottom, 15)
            ScoringList(events: mergeEvents(game.away.events ?? [Event](), game.home.events ?? [Event]()), away: game.away.abbr, home: game.home.abbr)
                .environmentObject(globalVariables)
                .listRowSeparator(.hidden)
        }
        .redacted(reason: showLoading ? .placeholder : [])
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
        guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/games/\(gameID)/boxscore.json?api_key=\(globalVariables.keys.sport_radar)") else {
            print("Invalid URL")
            return
        }
        
        do {
            showLoading = true
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let gameBoxscore = try? JSONDecoder().decode(GameBoxscore.self, from: jsonData) {
                game = gameBoxscore.game
                print("ScoreDetail JSON decoded.")
                showLoading = false
            }
        } catch {
            print("Invalid ScoreDetail data")
        }
    }
}

struct GamesDetail_Previews: PreviewProvider {
    static var previews: some View {
        ScoreDetail(gameID: "00cb0901-a2c1-411a-8884-f03190a54e8a")
            .environmentObject(ModelData())
            .environmentObject(GlobalVariables())
    }
}
