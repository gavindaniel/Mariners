//
//  PlayerProfile.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let playerProfile = try? newJSONDecoder().decode(PlayerProfile.self, from: jsonData)

import Foundation

// MARK: - PlayerProfile
struct PlayerProfile: Codable {
    let player: Player
    let comment: String

    enum CodingKeys: String, CodingKey {
        case player
        case comment = "_comment"
    }
}

// MARK: - Player
//struct Player: Codable {
//    let id: String
//    let status: Status
//    let position: PositionEnum
//    let primaryPosition: Name
//    let firstName, lastName, preferredName, jerseyNumber: String
//    let depth: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id, status, position
//        case primaryPosition = "primary_position"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case preferredName = "preferred_name"
//        case jerseyNumber = "jersey_number"
//        case depth
//    }
//}

// MARK: - Player
struct Player: Codable {
    let id, status, position: String
//    let primaryPosition: Position
    let primaryPosition: Name
    let firstName, lastName, preferredName, jerseyNumber: String
    // for depth chart
    let depth: Int?
//    let fullName, height, weight, throwHand: String
//    let batHand, highSchool, birthdate, birthstate: String
//    let birthcountry, birthcity, proDebut: String
//    let updated: Date
//    let reference: String
//    let draft: Draft
//    let team: PlayerTeam
//    let seasons: [Season]

    enum CodingKeys: String, CodingKey {
        case id, status, position
        case primaryPosition = "primary_position"
        case firstName = "first_name"
        case lastName = "last_name"
        case preferredName = "preferred_name"
        case jerseyNumber = "jersey_number"
//        case fullName = "full_name"
//        case height, weight
//        case throwHand = "throw_hand"
//        case batHand = "bat_hand"
//        case highSchool = "high_school"
//        case birthdate, birthstate, birthcountry, birthcity
//        case proDebut = "pro_debut"
//        case updated, reference, draft, team, seasons
        // for depth chart
        case depth
    }
}

//// MARK: - Draft
//struct Draft: Codable {
//    let teamID: String
//    let year, round, pick: Int
//
//    enum CodingKeys: String, CodingKey {
//        case teamID = "team_id"
//        case year, round, pick
//    }
//}

enum Position: String, Codable {
    case cf = "CF"
    case lf = "LF"
    case rf = "RF"
}

//// MARK: - Season
//struct Season: Codable {
//    let id: String
//    let year: Int
//    let type: TypeEnum
//    let totals: Totals
//    let teams: [TeamElement]
//}
//
//// MARK: - TeamElement
//struct TeamElement: Codable {
//    let name, market, abbr, id: String
//    let statistics: Statistics
//    let splits: Splits?
//}
//
//// MARK: - Splits
//struct Splits: Codable {
//    let hitting: SplitsHitting
//}
//
//// MARK: - SplitsHitting
//struct SplitsHitting: Codable {
//    let overall: [PurpleOverall]
//}
//
//// MARK: - PurpleOverall
//struct PurpleOverall: Codable {
//    let total, dayNight, venue, surface: [DayNight]
//    let month, homeAway, pitcherHand, opponent: [DayNight]
//
//    enum CodingKeys: String, CodingKey {
//        case total
//        case dayNight = "day_night"
//        case venue, surface, month
//        case homeAway = "home_away"
//        case pitcherHand = "pitcher_hand"
//        case opponent
//    }
//}
//
//// MARK: - DayNight
//struct DayNight: Codable {
//    let value: String?
//    let ab, runs, s, d: Int
//    let t, hr, rbi, bb: Int
//    let ibb, hbp, sb, cs: Int
//    let obp, slg, ops: Double
//    let h, ktotal: Int
//    let avg: String
//    let id, name, market, abbr: String?
//    let surface: Surface?
//}
//
//enum Surface: String, Codable {
//    case grass = "grass"
//    case turf = "turf"
//}
//
//// MARK: - Statistics
//struct Statistics: Codable {
//    let hitting: StatisticsHitting
//    let fielding: Fielding?
//}
//
//// MARK: - Fielding
//struct Fielding: Codable {
//    let overall: PositionClass
//    let positions: [PositionClass]?
//}
//
//// MARK: - PositionClass
//struct PositionClass: Codable {
//    let po, a, dp, tp: Int
//    let error, tc: Int
//    let fpct: Double
//    let cWp, pb: Int?
//    let rf: Double
//    let inn1: Int?
//    let inn2: Double?
//    let steal: Steal
//    let errors: Errors
//    let assists: Assists?
//    let games: Games
//    let position: Position?
//
//    enum CodingKeys: String, CodingKey {
//        case po, a, dp, tp, error, tc, fpct
//        case cWp = "c_wp"
//        case pb, rf
//        case inn1 = "inn_1"
//        case inn2 = "inn_2"
//        case steal, errors, assists, games, position
//    }
//}
//
//// MARK: - Assists
//struct Assists: Codable {
//    let outfield, total: Int
//}
//
//// MARK: - Errors
//struct Errors: Codable {
//    let throwing, fielding, interference, total: Int
//}
//
//// MARK: - Games
//struct Games: Codable {
//    let start, play, finish, complete: Int
//}
//
//// MARK: - Steal
//struct Steal: Codable {
//    let caught, stolen, pickoff: Int
//    let pct: Double
//}
//
//// MARK: - StatisticsHitting
//struct StatisticsHitting: Codable {
//    let overall: FluffyOverall
//}
//
//// MARK: - FluffyOverall
//struct FluffyOverall: Codable {
//    let ab, lob, rbi: Int
//    let abhr, abk: Double
//    let bip: Int
//    let babip, bbk, bbpa, iso: Double
//    let obp, ops, seca, slg: Double
//    let xbh, pitchCount: Int
//    let lobRisp2Out, teamLob, abRisp, hitRisp: Int?
//    let rbi2Out, linedrive, groundball, popup: Int?
//    let flyball: Int?
//    let ap: Int
//    let avg: String
//    let gofo: Double
//    let onbase: Onbase
//    let runs: Runs
//    let outcome: Outcome
//    let outs: [String: Int]
//    let steal: Steal
//    let pitches: Pitches?
//    let games: Games
//
//    enum CodingKeys: String, CodingKey {
//        case ab, lob, rbi, abhr, abk, bip, babip, bbk, bbpa, iso, obp, ops, seca, slg, xbh
//        case pitchCount = "pitch_count"
//        case lobRisp2Out = "lob_risp_2out"
//        case teamLob = "team_lob"
//        case abRisp = "ab_risp"
//        case hitRisp = "hit_risp"
//        case rbi2Out = "rbi_2out"
//        case linedrive, groundball, popup, flyball, ap, avg, gofo, onbase, runs, outcome, outs, steal, pitches, games
//    }
//}
//
//// MARK: - Onbase
//struct Onbase: Codable {
//    let s, d, t, hr: Int
//    let tb, bb, ibb, hbp: Int
//    let fc, roe, h, cycle: Int
//}
//
//// MARK: - Outcome
//struct Outcome: Codable {
//    let klook, kswing, ktotal, ball: Int
//    let iball, dirtball, foul: Int
//}
//
//// MARK: - Pitches
//struct Pitches: Codable {
//    let count, btotal, ktotal: Int
//}
//
//// MARK: - Runs
//struct Runs: Codable {
//    let total: Int
//}
//
//// MARK: - Totals
//struct Totals: Codable {
//    let statistics: Statistics
//    let splits: Splits?
//    let statcastMetrics: StatcastMetrics?
//
//    enum CodingKeys: String, CodingKey {
//        case statistics, splits
//        case statcastMetrics = "statcast_metrics"
//    }
//}
//
//// MARK: - StatcastMetrics
//struct StatcastMetrics: Codable {
//    let hitting: StatcastMetricsHitting
//}
//
//// MARK: - StatcastMetricsHitting
//struct StatcastMetricsHitting: Codable {
//    let overall: [TentacledOverall]
//}
//
//// MARK: - TentacledOverall
//struct TentacledOverall: Codable {
//    let launchAngle, maxHeight, travelTime, homerunDistance: BarreledBall?
//    let hangTime, barreledBall, launchSpeed, distance: BarreledBall?
//    let launchSpinRate, travelDistance, generatedSpeed: BarreledBall?
//
//    enum CodingKeys: String, CodingKey {
//        case launchAngle = "launch_angle"
//        case maxHeight = "max_height"
//        case travelTime = "travel_time"
//        case homerunDistance = "homerun_distance"
//        case hangTime = "hang_time"
//        case barreledBall = "barreled_ball"
//        case launchSpeed = "launch_speed"
//        case distance
//        case launchSpinRate = "launch_spin_rate"
//        case travelDistance = "travel_distance"
//        case generatedSpeed = "generated_speed"
//    }
//}
//
//// MARK: - BarreledBall
//struct BarreledBall: Codable {
//    let min, avg, max: Double
//    let count: Int
//}
//
//enum TypeEnum: String, Codable {
//    case pre = "PRE"
//    case pst = "PST"
//    case reg = "REG"
//}
//
//// MARK: - PlayerTeam
//struct PlayerTeam: Codable {
//    let name, market, abbr, id: String
//}

