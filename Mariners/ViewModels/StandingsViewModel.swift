//
//  StandingsViewModel.swift
//  Mariners
//
//  Created by Gavin Daniel on 9/4/22.
//

import Foundation
import Firebase

class StandingsViewModel: ObservableObject {
//    @Published var standings = [Standings]()
    @Published var standings = ModelData().standings
    
    func getData() {
        
        // get a reference to the database
        let db = Firestore.firestore()
        
        // create reference
        let docRef = db.collection("standings").document("reg")
        
        docRef.getDocument { document, error in
            if let error = error as NSError? {
                // handle error
            }
            else {
                if let document = document {
                    do {
//                        self.standings = try document.data(as: Standings.self)
//                        return try? document.data(as: Standings.self)
                        self.standings = try document.data(as: Standings.self)
                    }
                    catch {
                        print(error)
                    }
                }
            }
        }
    }
}

