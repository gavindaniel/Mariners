//
//  ScoringRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//

import SwiftUI

struct ScoringRow: View {
    var isLoading: Bool
    var aScore: Int
    var hScore: Int
    var event: Event
    @State private var player = ModelData().player_profile.player
    
    var body: some View {
        HStack {
            InningView(inning: event.inning, inningHalf: event.inningHalf.rawValue)
            Spacer()
            Text(player.lastName + getOutcome(event.hitterOutcome))
                .font(.footnote)
                .frame(width: 200, alignment: .leading)
            Spacer()
            Text(getScore("away", aScore, event.runners.count, event.inningHalf.rawValue))
            Spacer()
            Text(getScore("home", hScore, event.runners.count, event.inningHalf.rawValue))
        }
        .padding()
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/players/\(event.hitterID)/profile.json?api_key=wnfa3bdarch3hxhh8jv64znu") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let player_profile = try? JSONDecoder().decode(PlayerProfile.self, from: jsonData) {
                player = player_profile.player
                print("JSON decoded.")
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ScoringRow_Previews: PreviewProvider {
    static var previews: some View {
        ScoringRow(isLoading: false, aScore: 0, hScore: 0, event: ModelData().score.game.home.events![0])
    }
}
