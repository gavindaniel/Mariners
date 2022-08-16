//
//  Game.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import Foundation
import SwiftUI

struct Game: Hashable, Codable, Identifiable {
    var id: Int
    var awayName: String
    var homeName: String
    var awayInits: String
    var homeInits: String
    var awayScore: Int
    var homeScore: Int
    var inningHalf: String
    var inning: String
    var outs: Int
    var awayRecord: String
    var homeRecord: String
    
    private var awayLogoName: String
    var awayLogo: Image {
        Image(awayLogoName)
    }
    
    private var homeLogoName: String
    var homeLogo: Image {
        Image(homeLogoName)
    }
}
