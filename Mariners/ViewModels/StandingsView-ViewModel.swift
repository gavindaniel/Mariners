//
//  StandingsView-ViewModel.swift
//  Mariners
//
//  Created by Gavin Daniel on 9/23/22.
//

import Firebase
import Foundation

extension StandingsView {
    @MainActor class ViewModel: ObservableObject {
        @Published var standings = ModelData().standings
        @Published var showLoading: Bool = true
        
        func getData() {
            // show loading
            self.showLoading = true
            // get a reference to the database
            let db = Firestore.firestore()
            // create reference
            let docRef = db.collection("standings").document("reg")
            // get the document
            docRef.getDocument { document, error in
                if (error as NSError?) != nil {
                    // handle error
                    // old: if let error = error as NSError? {
                }
                else {
                    if let document = document {
                        do {
                            self.standings = try document.data(as: Standings.self)
                            print("standings data retreived")
                            // hide loading and show data
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
