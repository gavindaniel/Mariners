//
//  Standings.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/16/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let standings = try? newJSONDecoder().decode(Standings.self, from: jsonData)

import Foundation

//struct StandingsResponse: Codable {
//    var results: [Standings]
//}

// MARK: - Standings
struct Standings: Codable {
    let league: League
    let comment: String

    enum CodingKeys: String, CodingKey {
        case league
        case comment = "_comment"
    }
}

// MARK: - Season
struct Season: Codable {
    let id: String
    let year: Int
    let type: String
    let leagues: [League]
}

// MARK: - League
struct League: Codable, Identifiable {
    let alias, name, id: String
    let season: Season?
    let divisions: [League]?
    let teams: [Team]?
}

// MARK: - Team
struct Team: Codable, Identifiable {
    let name, market, abbr, id: String
    let awayLoss, awayWin, eliminationNumber: Int
    let gamesBack: Double
    let homeLoss, homeWin, last10_Lost, last10_Won: Int
    let loss: Int
    let streak, wildCardBack: String
    let win: Int
    let winP: Double
    let alLoss, alWin: Int?
    let cLoss, cWin, wLoss, wWin: Int
    let eLoss, eWin, divisionEliminationNumber: Int
    let rank: Rank
    let nlLoss, nlWin: Int?

    enum CodingKeys: String, CodingKey {
        case name, market, abbr, id
        case awayLoss = "away_loss"
        case awayWin = "away_win"
        case eliminationNumber = "elimination_number"
        case gamesBack = "games_back"
        case homeLoss = "home_loss"
        case homeWin = "home_win"
        case last10_Lost = "last_10_lost"
        case last10_Won = "last_10_won"
        case loss, streak
        case wildCardBack = "wild_card_back"
        case win
        case winP = "win_p"
        case alLoss = "al_loss"
        case alWin = "al_win"
        case cLoss = "c_loss"
        case cWin = "c_win"
        case wLoss = "w_loss"
        case wWin = "w_win"
        case eLoss = "e_loss"
        case eWin = "e_win"
        case divisionEliminationNumber = "division_elimination_number"
        case rank
        case nlLoss = "nl_loss"
        case nlWin = "nl_win"
    }
}

// MARK: - Rank
struct Rank: Codable {
    let division, league: Int
}
