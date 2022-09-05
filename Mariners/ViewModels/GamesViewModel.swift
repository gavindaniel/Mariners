//
//  GamesViewModel.swift
//  Mariners
//
//  Created by Gavin Daniel on 9/4/22.
//

import Foundation
import Firebase

class GamesViewModel: ObservableObject {
    @Published var boxscores = [DailyBoxscore]()
    
    func getData() {
        
        // get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("boxscores").getDocuments { snapshot, error in
            
            // check for error
            if error == nil {
                // No errors
                if let snapshot = snapshot {
                    // update the list property in the main thread
                    DispatchQueue.main.async {
                        // get all the documents and create articles
                        self.boxscores = snapshot.documents.map { d in
                            // create an article object for each document returned
                            return DailyBoxscore(league: (d["league"] as? LeagueBoxscore)!)
                        }
                    }
                }
            } else {
                // Handle the error
            }
        }
    }
}
