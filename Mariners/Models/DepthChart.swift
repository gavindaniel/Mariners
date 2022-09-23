//
//  DepthChart.swift
//  Mariners
//
//  Created by Gavin Daniel on 9/20/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let depthChart = try? newJSONDecoder().decode(DepthChart.self, from: jsonData)

import Foundation

// MARK: - DepthChart
struct DepthChart: Codable {
    let league: League
    let teams: [Team]
    let comment: String

    enum CodingKeys: String, CodingKey {
        case league, teams
        case comment = "_comment"
    }
}

// MARK: - League
//struct League: Codable {
//    let alias, name, id: String
//}

// MARK: - Team
//struct Team: Codable {
//    let name, market, abbr, id: String
//    let positions: [PositionElement]
//}

// MARK: - PositionElement
struct PositionElement: Codable {
    let name: Name
    let desc: Desc
    let players: [Player]?
}

enum Desc: String, Codable {
    case bullpen = "Bullpen"
    case catcher = "Catcher"
    case centerField = "Center Field"
    case closer = "Closer"
    case designatedHitter = "Designated Hitter"
    case firstBase = "First Base"
    case leftField = "Left Field"
    case rightField = "Right Field"
    case secondBase = "Second Base"
    case shortstop = "Shortstop"
    case startingPitcher = "Starting Pitcher"
    case thirdBase = "Third Base"
}

enum Name: String, Codable {
    case bp = "BP"
    case c = "C"
    case cf = "CF"
    case cl = "CL"
    case dh = "DH"
    case lf = "LF"
    case rf = "RF"
    case rp = "RP"
    case sp = "SP"
    case ss = "SS"
    case the1B = "1B"
    case the2B = "2B"
    case the3B = "3B"
}

//// MARK: - Player
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

enum PositionEnum: String, Codable {
    case c = "C"
    case dh = "DH"
    case of = "OF"
    case p = "P"
    case positionIF = "IF"
}

enum Status: String, Codable {
    case a = "A"
    case d60 = "D60"
    case min = "MIN"
}

