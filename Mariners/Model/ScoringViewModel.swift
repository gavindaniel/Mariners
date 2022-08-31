//
//  ScoringViewModel.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/31/22.
//

import SwiftUI

class ScoringViewModel: ObservableObject {
    @Published var awayScore: Int = 0
    @Published var homeScore: Int = 0
    
    func addScore(_ inning: String, _ inningHalf: String, _ add: Int) {
        if inningHalf == "T" {
            self.awayScore += add
//            print("inning: " + inning + "  half: " + inningHalf)
//            print("\tadd: " + String(add) + "  score: " + String(self.awayScore))
        }
        else if inningHalf == "B" {
            self.homeScore += add
//            print("inning: " + inning + "  half: " + inningHalf)
//            print("\tadd: " + String(add) + "  score: " + String(self.homeScore))
        }
    }
    
    func getScore(_ side: String) -> Int {
//        print("away: " + String(self.awayScore) + "\thome: " + String(self.homeScore))
        if side == "away" { return self.awayScore }
        else { return self.homeScore }
    }
}
