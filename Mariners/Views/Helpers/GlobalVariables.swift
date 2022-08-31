//
//  GlobalVariables.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/24/22.
//

import Foundation

class GlobalVariables: ObservableObject {

    @Published var myDate = Date()
    @Published var aScore = 0
    @Published var hScore = 0
    var key = "72ztxuby5j9ks2369sjbqee4"

    func addScore(_ inningHalf: String, _ add: Int) {
        if inningHalf == "T" { self.aScore += add }
        else if inningHalf == "B" { self.hScore += add }
    }
}
