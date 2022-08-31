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
    
    func addScore(_ inningHalf: String, _ add: Int) {
        if inningHalf == "T" { self.awayScore += add }
        else if inningHalf == "B" { self.homeScore += add }
    }
}
