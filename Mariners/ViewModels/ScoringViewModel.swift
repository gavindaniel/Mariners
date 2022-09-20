//
//  ScoringViewModel.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/31/22.
//

import Foundation
import Firebase
import SwiftUI

class ScoringViewModel: ObservableObject {
    @Published var awayScore: Int = 0
    @Published var homeScore: Int = 0
    @Published var rosters = ModelData().rosters
    
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
    
    func getRosterData() {
        
        // get a reference to the database
        let db = Firestore.firestore()
        
        // create reference
        let docRef = db.collection("depth").document("mlb")
        
        docRef.getDocument { document, error in
            if let error = error as NSError? {
                // handle error
            }
            else {
                if let document = document {
                    do {
                        self.rosters = try document.data(as: DepthChart.self)
                    }
                    catch {
                        print(error)
                    }
                }
            }
        }
    }
}
