//
//  ScoringFunctions.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//

import Foundation
import SceneKit

func mergeEvents(_ awayEvents: [Event], _ homeEvents: [Event]) -> [Event] {
    var events = [Event]()
    var i = 0, j = 0
    
    while(i < awayEvents.count && j < homeEvents.count) {
        // e.g. if Top 1st < Bottom 2nd then add Top 1st
        if (awayEvents[i].inning < homeEvents[j].inning) {
            events.append(awayEvents[i])
            i += 1
        // e.g. if Top 2nd > Bottom 1st then add Bottom 1st
        } else if (awayEvents[i].inning > homeEvents[j].inning) {
            events.append(homeEvents[j])
            j += 1
        // e.g. if Top 1st == Bottom 1st then add Top 1st
        } else {
            events.append(awayEvents[i])
            i += 1
        }
    }
    
    while (i < awayEvents.count)
    {
        events.append(awayEvents[i])
        i += 1
    }

    while (j < homeEvents.count)
    {
        events.append(homeEvents[j])
        j += 1
    }
    
    return events
}


//func getOutcome(_ hitter_outcome: String) -> String {
//    switch hitter_outcome {
//    case "aS": return " singled."
//    case "aD": return " doubled."
//    case "aT": return " tripled."
//    case "aHR": return " homered."
//    case "oSF": return " hit a sacrifice fly."
//    case "oGO": return " grounded into fielder's choice."
//    default: return " \(hitter_outcome)" // "unknown."
//    }
//}


func getPitchOutcome( _ pitchOutcomes: [PitchOutcome], _ hitter_outcome: String) -> String {
    if pitchOutcomes.contains(where: { $0.id == hitter_outcome }) {
        let pitchOutcome = pitchOutcomes.first(where: { $0.id == hitter_outcome })
        return pitchOutcome!.desc
    } else {
        return " \(hitter_outcome)" // "unknown."
    }
}


func getScore(_ side: String, _ score: Int, _ add: Int , _ inningHalf: String) -> String {
    if side == "away" && inningHalf == "T" { return String(score + add) }
    else if side == "home" && inningHalf == "B" { return String(score + add) }
    else { return String(score) }
}

func addScore(aScore: Int, hScore: Int) {
    
}

//func getPlayerName(_ playerID: String) async -> String {
//    let player: Player
//    guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/players/\(playerID)/profile.json?api_key=wnfa3bdarch3hxhh8jv64znu") else {
//        print("Invalid URL")
//        return playerID
//    }
//    
//    do {
//        let (jsonData, _) = try await URLSession.shared.data(from: url)
//        
//        if let player_profile = try? JSONDecoder().decode(PlayerProfile.self, from: jsonData) {
//            player = player_profile.player
//            print("JSON decoded.")
//            return player.lastName
//        }
//    } catch {
//        print("Invalid data")
//        return playerID
//    }
//    return playerID
//}
