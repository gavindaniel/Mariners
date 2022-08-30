//
//  Game.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/22/22.
//

import Foundation

// MARK: - Game
struct Game: Codable {
//    var id, status: String
    var id: String
    var status: GameStatus // Status
    let scheduled: String
//    var homeTeam, awayTeam: String
    var outcome: Outcome?
    var gameFinal: Final?
    var home: Home
    var away: Away
//    var pitching: Pitching?


    enum CodingKeys: String, CodingKey {
        case id, status
        case scheduled
//        case homeTeam = "home_team"
//        case awayTeam = "away_team"
        case outcome
        case gameFinal = "final"
        case home, away // , pitching
    }
}

enum GameStatus: String, Codable {
    case closed = "closed"
    case inprogress = "inprogress"
    case scheduled = "scheduled"
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
//    var count: Count?
//    var hitter: Hitter?
//    var pitcher: PitcherClass?
//    var runners: [OutcomeRunner]?

    enum CodingKeys: String, CodingKey {
        case type
        case currentInning = "current_inning"
        case currentInningHalf = "current_inning_half"
//        case count // , hitter, pitcher, runners
    }
}

// MARK: - Away
struct Away: Codable {
    var name, market, abbr, id: String
    var runs, hits, errors, win: Int
    var loss: Int
//    var startingPitcher: Pitcher?

    var scoring: [AwayScoring]?
    var events: [Event]?

    enum CodingKeys: String, CodingKey {
        case name, market, abbr, id, runs, hits, errors, win, loss
//        case startingPitcher = "starting_pitcher"
        case scoring, events
    }
}

// MARK: - Home
struct Home: Codable {
    var name, market, abbr, id: String
    var runs, hits, errors, win: Int
    var loss: Int
//    var startingPitcher: Pitcher
    var scoring: [HomeScoring]?
    var events: [Event]?

    enum CodingKeys: String, CodingKey {
        case name, market, abbr, id, runs, hits, errors, win, loss
//        case startingPitcher = "starting_pitcher"
        case scoring, events
    }
}

// MARK: - AwayScoring
struct AwayScoring: Codable, Identifiable {
    var id = UUID()
    var number, sequence: Int
    var runs, hits, errors: String? //Errors
//    var type: String
    
    enum CodingKeys: String, CodingKey {
        case number, sequence, runs, hits, errors
//        case type = "inning"
    }
    //
//    init(runs: String? = nil, hits: String? = nil, errors: String? = nil) {
//        self.runs = runs
//        self.hits = hits
//        self.errors = errors
//    }
    // custom decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decode(Int.self, forKey: .number)
        sequence = try container.decode(Int.self, forKey: .sequence)

        do {
            runs = try String(container.decode(Int.self, forKey: .runs))
        } catch DecodingError.typeMismatch {
            runs = try container.decode(String.self, forKey: .runs)
        }
        
        do {
            hits = try String(container.decode(Int.self, forKey: .hits))
        } catch DecodingError.typeMismatch {
            hits = try container.decode(String.self, forKey: .hits)
        }
        
        do {
            errors = try String(container.decode(Int.self, forKey: .errors))
        } catch DecodingError.typeMismatch {
            errors = try container.decode(String.self, forKey: .errors)
        }
    }
}


// MARK: - HomeScoring
struct HomeScoring: Codable, Identifiable {
    var id = UUID()
    var number, sequence: Int
    var runs, hits, errors: String? // Errors
//    var type: String
    
    enum CodingKeys: String, CodingKey {
        case number, sequence, runs, hits, errors
//        case type = "inning"
    }
    //
//    init(runs: String? = nil, hits: String? = nil, errors: String? = nil) {
//        self.runs = runs
//        self.hits = hits
//        self.errors = errors
//    }
    // custom decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decode(Int.self, forKey: .number)
        sequence = try container.decode(Int.self, forKey: .sequence)

        do {
            runs = try String(container.decode(Int.self, forKey: .runs))
        } catch DecodingError.typeMismatch {
            runs = try container.decode(String.self, forKey: .runs)
        }
        
        do {
            hits = try String(container.decode(Int.self, forKey: .hits))
        } catch DecodingError.typeMismatch {
            hits = try container.decode(String.self, forKey: .hits)
        }
        
        do {
            errors = try String(container.decode(Int.self, forKey: .errors))
        } catch DecodingError.typeMismatch {
            errors = try container.decode(String.self, forKey: .errors)
        }
    }
}

enum Errors: Decodable {
    case int(Int)
    case string(String)
}

//enum Errors: Codable {
//    case integer(Int)
//    case string(String)
//
//
//    // custom decoding
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//
//        if let strCode = try? container.decode(String.self) {
//            self = strCode
//        } else if let intCode = try? container.decode(Int.self) {
//            self = String(intCode)
//        } else {
//            self = nil
//        }
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .integer(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        }
//    }
//
////    init(from decoder: Decoder) throws {
////        let container = try decoder.singleValueContainer()
////        if let x = try? container.decode(Int.self) {
////            self = .integer(x)
////            return
////        }
////        if let x = try? container.decode(String.self) {
////            self = .string(x)
////            return
////        }
////        throw DecodingError.typeMismatch(Errors.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Errors"))
////    }
////
////    func encode(to encoder: Encoder) throws {
////        var container = encoder.singleValueContainer()
////        switch self {
////        case .integer(let x):
////            try container.encode(x)
////        case .string(let x):
////            try container.encode(x)
////        }
////    }
//}


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
struct Event: Codable, Identifiable {
//    var id = UUID()
    var hitterID, pitcherID: String
    var inning: Int
    var inningHalf: InningHalf
    var type: TypeEnum
    var hitterOutcome, id: String
    var runners: [Runner]

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
    var startingBase: Int
    var firstName, lastName, preferredName, jerseyNumber: String
    var id: String

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
    var preferredName, firstName, lastName, jerseyNumber: String
    var id: String
    var win, loss: Int
    var era: Double

    enum CodingKeys: String, CodingKey {
        case preferredName = "preferred_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case jerseyNumber = "jersey_number"
        case id, win, loss, era
    }
}

// MARK: - Pitching
struct Pitching: Codable {
    var win, loss, save: Loss
    var hold, blownSave: [Loss]

    enum CodingKeys: String, CodingKey {
        case win, loss, save, hold
        case blownSave = "blown_save"
    }
}

// MARK: - Loss
struct Loss: Codable {
    var preferredName, firstName, lastName, jerseyNumber: String
    var status, position, primaryPosition, id: String
    var win, loss, save, hold: Int
    var blownSave: Int

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
