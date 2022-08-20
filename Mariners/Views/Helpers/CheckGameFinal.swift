//
//  CheckGameFinal.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import Foundation

func checkGameFinal (_ inning: String,_  half: String, _ outs: Int) -> Bool {
    if inning == "9th" && half == "Bottom" && outs == 3 {
        return true
    } else {
        return false
    }
}
