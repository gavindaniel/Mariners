//
//  DailyBoxscore.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   var dailyBoxscore = try? newJSONDecoder().decode(DailyBoxscore.self, from: jsonData)

import Foundation

// MARK: - DailyBoxscore
struct DailyBoxscore: Codable {
    var id = UUID()
    var league: LeagueBoxscore
    enum CodingKeys: String, CodingKey {
        case league
    }
}

// MARK: - League
struct LeagueBoxscore: Codable {
    var alias, name, id, date: String
    var games: [GameElement]
}

// MARK: - GameElement
struct GameElement: Codable, Identifiable {
    var id = UUID()
    var game: Game
    enum CodingKeys: String, CodingKey {
        case game
    }
}
