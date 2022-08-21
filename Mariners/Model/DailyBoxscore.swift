//
//  DailyBoxscore.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dailyBoxscore = try? newJSONDecoder().decode(DailyBoxscore.self, from: jsonData)

import Foundation

// MARK: - DailyBoxscore
struct DailyBoxscore: Codable {
    let league: LeagueBoxscore
    let comment: String

    enum CodingKeys: String, CodingKey {
        case league
        case comment = "_comment"
    }
}

// MARK: - League
struct LeagueBoxscore: Codable {
    let alias, name, id, date: String
    let games: [GameElement]
}

// MARK: - GameElement
struct GameElement: Codable, Identifiable {
    var id: UUID
    let game: GameGame
}

// MARK: - GameGame
struct GameGame: Codable {
    let id: String
    let status: GameStatus
    let coverage: Coverage
    let gameNumber: Int
    let dayNight: DayNight
    let scheduled: Date
    let homeTeam, awayTeam: String
    let attendance: Int
    let duration: String
    let doubleHeader: Bool
    let entryMode: EntryMode
    let reference: String
    let venue: Venue
    let broadcast: Broadcast
    let weather: Weather
    let gameFinal: Final
    let home: Home
    let away: Away
    let pitching: Pitching

    enum CodingKeys: String, CodingKey {
        case id, status, coverage
        case gameNumber = "game_number"
        case dayNight = "day_night"
        case scheduled
        case homeTeam = "home_team"
        case awayTeam = "away_team"
        case attendance, duration
        case doubleHeader = "double_header"
        case entryMode = "entry_mode"
        case reference, venue, broadcast, weather
        case gameFinal = "final"
        case home, away, pitching
    }
}

// MARK: - Away
struct Away: Codable {
    let name, market, abbr, id: String
    let runs, hits, errors, win: Int
    let loss: Int
    let probablePitcher, startingPitcher: Pitcher
    let scoring: [AwayScoring]
    let events: [Event]

    enum CodingKeys: String, CodingKey {
        case name, market, abbr, id, runs, hits, errors, win, loss
        case probablePitcher = "probable_pitcher"
        case startingPitcher = "starting_pitcher"
        case scoring, events
    }
}

// MARK: - Event
struct Event: Codable {
    let hitterID, pitcherID: String
    let inning: Int
    let inningHalf: InningHalf
    let type: EventType
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

enum InningHalf: String, Codable {
    case b = "B"
    case t = "T"
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

enum EventType: String, Codable {
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
    let type: ScoringType
}

enum ScoringType: String, Codable {
    case inning = "inning"
}

// MARK: - Broadcast
struct Broadcast: Codable {
    let network: String
}

enum Coverage: String, Codable {
    case full = "full"
}

enum DayNight: String, Codable {
    case d = "D"
    case n = "N"
}

enum EntryMode: String, Codable {
    case stomp = "STOMP"
}

// MARK: - Final
struct Final: Codable {
    let inning: Int
    let inningHalf: InningHalf

    enum CodingKeys: String, CodingKey {
        case inning
        case inningHalf = "inning_half"
    }
}

// MARK: - Home
struct Home: Codable {
    let name, market, abbr, id: String
    let runs, hits, errors, win: Int
    let loss: Int
    let probablePitcher, startingPitcher: Pitcher
    let scoring: [HomeScoring]
    let events: [Event]?

    enum CodingKeys: String, CodingKey {
        case name, market, abbr, id, runs, hits, errors, win, loss
        case probablePitcher = "probable_pitcher"
        case startingPitcher = "starting_pitcher"
        case scoring, events
    }
}

// MARK: - HomeScoring
struct HomeScoring: Codable {
    let number, sequence: Int
    let runs, hits, errors: Errors
    let type: ScoringType
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
    let win, loss: Loss
    let save: Loss?
    let hold, blownSave: [Loss]?

    enum CodingKeys: String, CodingKey {
        case win, loss, save, hold
        case blownSave = "blown_save"
    }
}

// MARK: - Loss
struct Loss: Codable {
    let preferredName, firstName, lastName, jerseyNumber: String
    let status: LossStatus
    let position: Position
    let primaryPosition: PrimaryPosition
    let id: String
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

enum Position: String, Codable {
    case p = "P"
}

enum PrimaryPosition: String, Codable {
    case rp = "RP"
    case sp = "SP"
}

enum LossStatus: String, Codable {
    case a = "A"
}

enum GameStatus: String, Codable {
    case closed = "closed"
}

// MARK: - Venue
struct Venue: Codable {
    let name, market: String
    let capacity: Int
    let surface: Surface
    let address, city, state, zip: String
    let country: Country
    let id, fieldOrientation: String
    let stadiumType: StadiumType
    let location: Location

    enum CodingKeys: String, CodingKey {
        case name, market, capacity, surface, address, city, state, zip, country, id
        case fieldOrientation = "field_orientation"
        case stadiumType = "stadium_type"
        case location
    }
}

enum Country: String, Codable {
    case usa = "USA"
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: String
}

enum StadiumType: String, Codable {
    case indoor = "indoor"
    case outdoor = "outdoor"
    case retractable = "retractable"
}

enum Surface: String, Codable {
    case grass = "grass"
    case turf = "turf"
}

// MARK: - Weather
struct Weather: Codable {
    let forecast, currentConditions: CurrentConditions

    enum CodingKeys: String, CodingKey {
        case forecast
        case currentConditions = "current_conditions"
    }
}

// MARK: - CurrentConditions
struct CurrentConditions: Codable {
    let tempF: Int
    let condition: Condition
    let humidity, dewPointF, cloudCover: Int
    let obsTime: String
    let wind: Wind

    enum CodingKeys: String, CodingKey {
        case tempF = "temp_f"
        case condition, humidity
        case dewPointF = "dew_point_f"
        case cloudCover = "cloud_cover"
        case obsTime = "obs_time"
        case wind
    }
}

enum Condition: String, Codable {
    case clear = "Clear"
    case overcast = "Overcast"
    case partlyCloudy = "Partly cloudy"
    case patchyRainPossible = "Patchy rain possible"
    case sunny = "Sunny"
}

// MARK: - Wind
struct Wind: Codable {
    let speedMph: Int
    let direction: String

    enum CodingKeys: String, CodingKey {
        case speedMph = "speed_mph"
        case direction
    }
}
