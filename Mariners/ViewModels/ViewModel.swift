//
//  ViewModel.swift
//  Mariners
//
//  Created by Gavin Daniel on 9/2/22.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    @Published var articles = [Article]()
    
    func getData() {
        
        // get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("articles").getDocuments { snapshot, error in
            
            // check for error
            if error == nil {
                // No errors
                if let snapshot = snapshot {
                    // update the list property in the main thread
                    DispatchQueue.main.async {
                        // get all the documents and create articles
                        self.articles = snapshot.documents.map { d in
                            // create an article object for each document returned
                            return Article(id: d.documentID, title: d["title"] as? String ?? "", date: d["date"] as? String ?? "", source: d["source"] as? String ?? "", author: d["author"] as? String ?? "", body: d["body"] as? String ?? "")
                        }
                    }
                }
            } else {
                // Handle the error
            }
        }
    }
}
