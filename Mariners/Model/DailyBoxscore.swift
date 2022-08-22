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
//    var comment: String
    enum CodingKeys: String, CodingKey {
        case league
//        case comment = "_comment"
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
    var game: GameGame
//    var comment: String
    enum CodingKeys: String, CodingKey {
        case game
//        case comment = "_comment"
    }
}

// MARK: - GameGame
struct GameGame: Codable {
    var id: String
    var status: GameStatus
//    var coverage: Coverage
//    var gameNumber: Int
//    var dayNight: DayNight
//    var scheduled: Date
//    var homeTeam, awayTeam: String
//    var attendance: Int
//    var duration: String
//    var doubleHeader: Bool
//    var entryMode: EntryMode
//    var reference: String
//    var venue: Venue
//    var broadcast: Broadcast
//    var weather: Weather
//    var gameFinal: Final
    var home: Home
    var away: Away
//    var pitching: Pitching

//    enum CodingKeys: String, CodingKey {
//        case id, status, coverage
//        case gameNumber = "game_number"
//        case dayNight = "day_night"
//        case scheduled
//        case homeTeam = "home_team"
//        case awayTeam = "away_team"
//        case attendance, duration
//        case doubleHeader = "double_header"
//        case entryMode = "entry_mode"
//        case reference, venue, broadcast, weather
//        case gameFinal = "final"
//        case home, away, pitching
//    }
}

// MARK: - Away
struct Away: Codable {
    var name, market, abbr, id: String
    var runs, hits, errors, win: Int
    var loss: Int
//    var probablePitcher, startingPitcher: Pitcher
//    var scoring: [AwayScoring]
//    var events: [Event]

    enum CodingKeys: String, CodingKey {
        case name, market, abbr, id, runs, hits, errors, win, loss
//        case probablePitcher = "probable_pitcher"
//        case startingPitcher = "starting_pitcher"
//        case scoring, events
    }
}

//// MARK: - Event
//struct Event: Codable {
//    var hitterID, pitcherID: String
//    var inning: Int
//    var inningHalf: InningHalf
//    var type: EventType
//    var hitterOutcome, id: String
//    var runners: [Runner]
//
//    enum CodingKeys: String, CodingKey {
//        case hitterID = "hitter_id"
//        case pitcherID = "pitcher_id"
//        case inning
//        case inningHalf = "inning_half"
//        case type
//        case hitterOutcome = "hitter_outcome"
//        case id, runners
//    }
//}
//
//enum InningHalf: String, Codable {
//    case b = "B"
//    case t = "T"
//}
//
//// MARK: - Runner
//struct Runner: Codable {
//    var startingBase: Int
//    var firstName, lastName, preferredName, jerseyNumber: String
//    var id: String
//
//    enum CodingKeys: String, CodingKey {
//        case startingBase = "starting_base"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case preferredName = "preferred_name"
//        case jerseyNumber = "jersey_number"
//        case id
//    }
//}
//
//enum EventType: String, Codable {
//    case pitch = "pitch"
//}
//
//// MARK: - Pitcher
//struct Pitcher: Codable {
//    var preferredName, firstName, lastName, jerseyNumber: String
//    var id: String
//    var win, loss: Int
//    var era: Double
//
//    enum CodingKeys: String, CodingKey {
//        case preferredName = "preferred_name"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case jerseyNumber = "jersey_number"
//        case id, win, loss, era
//    }
//}
//
//// MARK: - AwayScoring
//struct AwayScoring: Codable {
//    var number, sequence, runs, hits: Int
//    var errors: Int
//    var type: ScoringType
//}
//
//enum ScoringType: String, Codable {
//    case inning = "inning"
//}
//
//// MARK: - Broadcast
//struct Broadcast: Codable {
//    var network: String
//}
//
//enum Coverage: String, Codable {
//    case full = "full"
//}
//
//enum DayNight: String, Codable {
//    case d = "D"
//    case n = "N"
//}
//
//enum EntryMode: String, Codable {
//    case stomp = "STOMP"
//}
//
//// MARK: - Final
//struct Final: Codable {
//    var inning: Int
//    var inningHalf: InningHalf
//
//    enum CodingKeys: String, CodingKey {
//        case inning
//        case inningHalf = "inning_half"
//    }
//}
//
// MARK: - Home
struct Home: Codable {
    var name, market, abbr, id: String
    var runs, hits, errors, win: Int
    var loss: Int
//    var probablePitcher, startingPitcher: Pitcher
//    var scoring: [HomeScoring]
//    var events: [Event]?

    enum CodingKeys: String, CodingKey {
        case name, market, abbr, id, runs, hits, errors, win, loss
//        case probablePitcher = "probable_pitcher"
//        case startingPitcher = "starting_pitcher"
//        case scoring, events
    }
}

//// MARK: - HomeScoring
//struct HomeScoring: Codable {
//    var number, sequence: Int
//    var runs, hits, errors: Errors
//    var type: ScoringType
//}
//
//enum Errors: Codable {
//    case integer(Int)
//    case string(String)
//
//    init(from decoder: Decoder) throws {
//        var container = try decoder.singleValueContainer()
//        if var x = try? container.decode(Int.self) {
//            self = .integer(x)
//            return
//        }
//        if var x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        throw DecodingError.typeMismatch(Errors.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Errors"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .integer(var x):
//            try container.encode(x)
//        case .string(var x):
//            try container.encode(x)
//        }
//    }
//}
//
//// MARK: - Pitching
//struct Pitching: Codable {
//    var win, loss: Loss
//    var save: Loss?
//    var hold, blownSave: [Loss]?
//
//    enum CodingKeys: String, CodingKey {
//        case win, loss, save, hold
//        case blownSave = "blown_save"
//    }
//}
//
//// MARK: - Loss
//struct Loss: Codable {
//    var preferredName, firstName, lastName, jerseyNumber: String
//    var status: LossStatus
//    var position: Position
//    var primaryPosition: PrimaryPosition
//    var id: String
//    var win, loss, save, hold: Int
//    var blownSave: Int
//
//    enum CodingKeys: String, CodingKey {
//        case preferredName = "preferred_name"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case jerseyNumber = "jersey_number"
//        case status, position
//        case primaryPosition = "primary_position"
//        case id, win, loss, save, hold
//        case blownSave = "blown_save"
//    }
//}
//
//enum Position: String, Codable {
//    case p = "P"
//}
//
//enum PrimaryPosition: String, Codable {
//    case rp = "RP"
//    case sp = "SP"
//}
//
//enum LossStatus: String, Codable {
//    case a = "A"
//}
//
enum GameStatus: String, Codable {
    case closed = "closed"
}
//
//// MARK: - Venue
//struct Venue: Codable {
//    var name, market: String
//    var capacity: Int
//    var surface: Surface
//    var address, city, state, zip: String
//    var country: Country
//    var id, fieldOrientation: String
//    var stadiumType: StadiumType
//    var location: Location
//
//    enum CodingKeys: String, CodingKey {
//        case name, market, capacity, surface, address, city, state, zip, country, id
//        case fieldOrientation = "field_orientation"
//        case stadiumType = "stadium_type"
//        case location
//    }
//}
//
//enum Country: String, Codable {
//    case usa = "USA"
//}
//
//// MARK: - Location
//struct Location: Codable {
//    var lat, lng: String
//}
//
//enum StadiumType: String, Codable {
//    case indoor = "indoor"
//    case outdoor = "outdoor"
//    case retractable = "retractable"
//}
//
//enum Surface: String, Codable {
//    case grass = "grass"
//    case turf = "turf"
//}
//
//// MARK: - Weather
//struct Weather: Codable {
//    var forecast, currentConditions: CurrentConditions
//
//    enum CodingKeys: String, CodingKey {
//        case forecast
//        case currentConditions = "current_conditions"
//    }
//}
//
//// MARK: - CurrentConditions
//struct CurrentConditions: Codable {
//    var tempF: Int
//    var condition: Condition
//    var humidity, dewPointF, cloudCover: Int
//    var obsTime: String
//    var wind: Wind
//
//    enum CodingKeys: String, CodingKey {
//        case tempF = "temp_f"
//        case condition, humidity
//        case dewPointF = "dew_point_f"
//        case cloudCover = "cloud_cover"
//        case obsTime = "obs_time"
//        case wind
//    }
//}
//
//enum Condition: String, Codable {
//    case clear = "Clear"
//    case overcast = "Overcast"
//    case partlyCloudy = "Partly cloudy"
//    case patchyRainPossible = "Patchy rain possible"
//    case sunny = "Sunny"
//}
//
//// MARK: - Wind
//struct Wind: Codable {
//    var speedMph: Int
//    var direction: String
//
//    enum CodingKeys: String, CodingKey {
//        case speedMph = "speed_mph"
//        case direction
//    }
//}
