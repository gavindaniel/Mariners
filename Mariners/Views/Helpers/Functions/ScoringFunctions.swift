//
//  ScoringFunctions.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//

import Foundation
import SceneKit


// merge away & home events into a single sorted array
func mergeEvents(_ awayEvents: [Event], _ homeEvents: [Event]) -> [Event] {
    var events = [Event]()
    var i = 0, j = 0
    // merge events while there are still events in both arrays
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
    // add remaining events if any
    while (i < awayEvents.count)
    {
        events.append(awayEvents[i])
        i += 1
    }
    // add remaining events if any
    while (j < homeEvents.count)
    {
        events.append(homeEvents[j])
        j += 1
    }
    // return merged arrays
    return events
}


// get text string of scoring event
func getPitchOutcome( _ pitchOutcomes: [PitchOutcome], _ hitter_outcome: String) -> String {
    if pitchOutcomes.contains(where: { $0.id == hitter_outcome }) {
        let pitchOutcome = pitchOutcomes.first(where: { $0.id == hitter_outcome })
        return pitchOutcome!.desc
    } else {
        return " \(hitter_outcome)" // "unknown."
    }
}


// get text string of score based on event
func getScore(_ side: String, _ score: Int, _ add: Int , _ inningHalf: String) -> String {
    if side == "away" && inningHalf == "T" { return String(score + add) }
    else if side == "home" && inningHalf == "B" { return String(score + add) }
    else { return String(score) }
}


// get an array of runs scored for specified side
func getScores(_ side: String, _ game: Game) -> [String] {
    var arr = [String]()
    var i = 0
    
    if side == "away" {
        if game.away.scoring != nil {
            while i < game.away.scoring!.count {
                arr.append(game.away.scoring![i].runs!)
                i += 1
            }
        }
        
        while i < 9 { // FIXME: change later to account for games going into extras
            arr.append(" ")
            i += 1
        }
    } else { // side == "home"
        if game.home.scoring != nil {
            while i < game.home.scoring!.count {
                arr.append(game.home.scoring![i].runs!)
                i += 1
            }
        }
        
        while i < 9 { // FIXME: change later to account for games going into extras
            arr.append(" ")
            i += 1
        }
    }
        
    return arr
}


func getRunners() -> String {
    return "none."
}


//func addScore(aScore: Int, hScore: Int) {
//    
//}

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
