//
//  Game.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/22/22.
//

import Foundation

// MARK: - Game
struct Game: Codable {
    var id, status: String
//    var status: GameStatus
//    var homeTeam, awayTeam: String
    var outcome: Outcome?
    var gameFinal: Final?
    var home: Home
    var away: Away
//    var pitching: Pitching


    enum CodingKeys: String, CodingKey {
        case id, status
//        case homeTeam = "home_team"
//        case awayTeam = "away_team"
        case gameFinal = "final"
        case home, away // , pitching
    }
}

enum GameStatus: String, Codable {
    case closed = "closed"
}

// MARK: - Final
struct Final: Codable {
    var inning: Int
    var inningHalf: InningHalf

    enum CodingKeys: String, CodingKey {
        case inning
        case inningHalf = "inning_half"
    }
}

// MARK: - Outcome
struct Outcome: Codable {
    var type: String
    var currentInning: Int
    var currentInningHalf: String
    var count: Count
//    var hitter: Hitter
//    var pitcher: PitcherClass
//    var runners: [OutcomeRunner]

//    enum CodingKeys: String, CodingKey {
//        case type
//        case currentInning = "current_inning"
//        case currentInningHalf = "current_inning_half"
//        case count, hitter, pitcher, runners
//    }
}

// MARK: - Away
struct Away: Codable {
    var name, market, abbr, id: String
    var runs, hits, errors, win: Int
    var loss: Int
//    var startingPitcher: Pitcher

    let scoring: [AwayScoring]
//    let events: [Event]

    enum CodingKeys: String, CodingKey {
        case name, market, abbr, id, runs, hits, errors, win, loss
//        case startingPitcher = "starting_pitcher"
        case scoring  // , events
    }
}

// MARK: - Home
struct Home: Codable {
    var name, market, abbr, id: String
    var runs, hits, errors, win: Int
    var loss: Int
//    var startingPitcher: Pitcher
    var scoring: [HomeScoring]
//    var events: [Event]?

    enum CodingKeys: String, CodingKey {
        case name, market, abbr, id, runs, hits, errors, win, loss
//        case startingPitcher = "starting_pitcher"
        case scoring // , events
    }
}



// MARK: - Count
struct Count: Codable {
    var balls, strikes, outs, inning: Int
    var inningHalf: String
    var halfOver: Bool

    enum CodingKeys: String, CodingKey {
        case balls, strikes, outs, inning
        case inningHalf = "inning_half"
        case halfOver = "half_over"
    }
}


enum InningHalf: String, Codable {
    case b = "B"
    case t = "T"
}

// MARK: - Event
struct Event: Codable {
    let hitterID, pitcherID: String
    let inning: Int
    let inningHalf: InningHalf
    let type: TypeEnum
    let hitterOutcome, id: String
    let runners: [Runner]

    enum CodingKeys: String, CodingKey {
        case hitterID = "hitter_id"
        case pitcherID = "pitcher_id"
        case inning
        case inningHalf = "inning_half"
        case type
        case hitterOutcome = "hitter_outcome"
        case id, runners
    }
}

// MARK: - Runner
struct Runner: Codable {
    let startingBase: Int
    let firstName, lastName, preferredName, jerseyNumber: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case startingBase = "starting_base"
        case firstName = "first_name"
        case lastName = "last_name"
        case preferredName = "preferred_name"
        case jerseyNumber = "jersey_number"
        case id
    }
}


enum TypeEnum: String, Codable {
    case pitch = "pitch"
}

// MARK: - Pitcher
struct Pitcher: Codable {
    let preferredName, firstName, lastName, jerseyNumber: String
    let id: String
    let win, loss: Int
    let era: Double

    enum CodingKeys: String, CodingKey {
        case preferredName = "preferred_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case jerseyNumber = "jersey_number"
        case id, win, loss, era
    }
}

// MARK: - AwayScoring
struct AwayScoring: Codable {
    let number, sequence, runs, hits: Int
    let errors: Int
    let type: String
}


// MARK: - HomeScoring
struct HomeScoring: Codable {
    let number, sequence: Int
    let runs, hits, errors: Errors
    let type: String
}

enum Errors: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Errors.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Errors"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Pitching
struct Pitching: Codable {
    let win, loss, save: Loss
    let hold, blownSave: [Loss]

    enum CodingKeys: String, CodingKey {
        case win, loss, save, hold
        case blownSave = "blown_save"
    }
}

// MARK: - Loss
struct Loss: Codable {
    let preferredName, firstName, lastName, jerseyNumber: String
    let status, position, primaryPosition, id: String
    let win, loss, save, hold: Int
    let blownSave: Int

    enum CodingKeys: String, CodingKey {
        case preferredName = "preferred_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case jerseyNumber = "jersey_number"
        case status, position
        case primaryPosition = "primary_position"
        case id, win, loss, save, hold
        case blownSave = "blown_save"
    }
}
