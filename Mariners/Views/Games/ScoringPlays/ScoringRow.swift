//
//  ScoringRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//

import SwiftUI

struct ScoringRow: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var globalVariables: GlobalVariables
    @EnvironmentObject var scoringViewModel: ScoringViewModel
    @State private var player = ModelData().player_profile.player
    @State private var showLoading: Bool = false
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
                    Text(String(scoringViewModel.getScore("away")-7))
                }
                Spacer()
                VStack(spacing: 5) {
                    Text(home)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(scoringViewModel.getScore("home")-8))
                }
            }
        }
        .padding()
//        .task {
//            await loadData()
//        }
        .onAppear {
            scoringViewModel.addScore(String(event.inning), event.inningHalf.rawValue, event.runners.count)
        }
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
        ScoringRow(event: home.events![0], away: home.abbr, home: home.abbr)
            .environmentObject(ModelData())
    }
}
