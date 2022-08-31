//
//  CheckGameFinal.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import Foundation
import SwiftUI

func checkFinal (_ status: String) -> Bool {
    if status == "closed" { return true }
    else { return false }
}

func getEventHitters(_ events: [Event]) -> [String] {
    var arr = [String]()
    
    for event in events {
        arr.append(event.hitterID)
    }
    
    return arr
}

func getColor(_ side: String, _ game: Game) -> Color {
    if (checkFinal(game.status.rawValue)) {
        if side == "away" {
            if (game.away.runs > game.home.runs) { return .primary }
            else { return .secondary }
        } else {
            if (game.away.runs < game.home.runs) { return .primary }
            else { return .secondary }
        }
    } else { return .primary }
}
