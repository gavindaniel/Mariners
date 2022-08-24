//
//  Glossary.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/24/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let glossary = try? newJSONDecoder().decode(Glossary.self, from: jsonData)

import Foundation

// MARK: - Glossary
struct Glossary: Codable {
//    var id = UUID()
    let pitchTypes, playerStatuses: [PitchType]
    let pitchOutcomes: [PitchOutcome]
    let gameStatuses: [GameStatus2]
    let runnerOutcomes, postSeasonGames: [PitchOutcome]
    let playerPositions: [GameStatus2]
    let transactionTypes: [TransactionType]
    let comment: String

    enum CodingKeys: String, CodingKey {
        case pitchTypes = "pitch_types"
        case playerStatuses = "player_statuses"
        case pitchOutcomes = "pitch_outcomes"
        case gameStatuses = "game_statuses"
        case runnerOutcomes = "runner_outcomes"
        case postSeasonGames = "post_season_games"
        case playerPositions = "player_positions"
        case transactionTypes = "transaction_types"
        case comment = "_comment"
    }
}

// MARK: - GameStatus
struct GameStatus2: Codable {
    let id, desc, label: String
}

// MARK: - PitchOutcome
struct PitchOutcome: Codable {
    let id, desc: String
}

// MARK: - PitchType
struct PitchType: Codable {
    let id, type: String
}

// MARK: - TransactionType
struct TransactionType: Codable {
    let type, code: String
}
