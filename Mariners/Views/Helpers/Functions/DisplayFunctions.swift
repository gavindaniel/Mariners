//
//  OutsStrings.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/17/22.
//

import Foundation

func getOutsStrings(input: Int) -> [String] {
    switch input {
    case 0: return ["circle", "circle", "circle"]
    case 1: return ["circle.fill", "circle", "circle"]
    case 2: return ["circle.fill", "circle.fill", "circle"]
    case 3: return ["circle.fill", "circle.fill", "circle.fill"]
    default: return ["circle.fill", "circle.fill", "circle.fill"]
    }
}

func getInningText(input: Int) -> String {
    switch input {
    case 1: return "1st"
    case 2: return "2nd"
    case 3: return "3rd"
    default: return "\(String(input))th"
    }
}
