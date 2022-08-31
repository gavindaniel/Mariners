//
//  ScoringRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//

import SwiftUI

struct ScoringRow: View {
    @Binding var showLoading: Bool
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var globalVariables: GlobalVariables
    @State private var player = ModelData().player_profile.player
    var event: Event
    var away: String
    var home: String
    
    var body: some View {
        VStack {
            HStack {
                InningView(inning: event.inning, inningHalf: event.inningHalf.rawValue)
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    // check for Grand slam.
                    if event.hitterOutcome == "aHR" && event.runners.count == 4 {
                        Text("Grand Slam - (\(event.runners.count))")
                            .font(.footnote)
                    } else {
                        Text(getPitchOutcome(modelData.glossary.pitchOutcomes, event.hitterOutcome)) //  + " - (\(event.runners.count))"
                            .font(.footnote)
                    }
                    Text(player.lastName + "  (" + String(event.runners.count) + " RBI)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .font(.footnote)
                .frame(width: 165, alignment: .leading)
                Spacer()
                VStack(spacing: 5) {
                    Text(away)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(getScore("away", 0, event.runners.count, event.inningHalf.rawValue))
                }
                Spacer()
                VStack(spacing: 5) {
                    Text(home)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(getScore("home", 0, event.runners.count, event.inningHalf.rawValue))
                }
            }
        }
        .padding()
//        .task {
//            await loadData()
//        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/players/\(event.hitterID)/profile.json?api_key=\(globalVariables.key)") else {
            print("Invalid URL")
            return
        }
        
        do {
            showLoading = true
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let player_profile = try? JSONDecoder().decode(PlayerProfile.self, from: jsonData) {
                player = player_profile.player
                print("player JSON decoded.")
                showLoading = false
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ScoringRow_Previews: PreviewProvider {
    static var home = ModelData().score.game.home
    
    static var previews: some View {
        ScoringRow(showLoading: .constant(false), event: home.events![0], away: home.abbr, home: home.abbr)
            .environmentObject(ModelData())
    }
}
