//
//  GamesViewModel.swift
//  Mariners
//
//  Created by Gavin Daniel on 9/4/22.
//

import Foundation
import Firebase

class GamesViewModel: ObservableObject {
    @Published var scores = ModelData().scores
        
    func getData(date: String) {
        // get a reference to the database
        let db = Firestore.firestore()
        
        // create reference
        let docRef = db.collection("boxscores").document(date)
        print("getData date: " + date)
        
        docRef.getDocument { document, error in
            if let error = error as NSError? {
                // handle error
            }
            else {
                if let document = document {
                    do {
                        self.scores = try document.data(as: DailyBoxscore.self)
                        print("scores data retreived")
                    }
                    catch {
                        print(error)
                    }
                }
            }
        }
    }
}
