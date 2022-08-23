//
//  GameBoxscore.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/22/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gameBoxscore = try? newJSONDecoder().decode(GameBoxscore.self, from: jsonData)


import Foundation


// MARK: - GameBoxscore
struct GameBoxscore: Codable {
    let game: Game
    let comment: String

    enum CodingKeys: String, CodingKey {
        case game
        case comment = "_comment"
    }
}
