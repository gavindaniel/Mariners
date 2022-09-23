//
//  ScoresView-ViewModel.swift
//  Mariners
//
//  Created by Gavin Daniel on 9/23/22.
//

import Firebase
import Foundation

extension ScoresView {
    @MainActor class ViewModel: ObservableObject {
        @Published var scores = ModelData().scores
        @Published var showLoading: Bool = true
            
        func getData(date: String) {
            // show loading
            self.showLoading = true
            // get a reference to the database
            let db = Firestore.firestore()
            // create reference
            let docRef = db.collection("boxscores").document(date)
            print("getData date: " + date)
            // get document
            docRef.getDocument { document, error in
                if (error as NSError?) != nil {
                    // handle error
                    // old: if let error = error as NSError? {
                }
                else {
                    if let document = document {
                        do {
                            self.scores = try document.data(as: DailyBoxscore.self)
                            print("scores data retreived")
                            self.showLoading = false
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
        }
    }
}
