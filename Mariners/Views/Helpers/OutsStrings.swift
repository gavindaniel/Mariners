//
//  OutsStrings.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/17/22.
//

import Foundation

func getOutsStrings(input: Int) -> [String] {

    switch input {
    case 0:
        return ["circle", "circle", "cirlce"]
    case 1:
        return ["circle.fill", "circle", "cirlce"]
    case 2:
        return ["circle.fill", "circle.fill", "cirlce"]
    case 3:
        return ["circle.fill", "circle.fill", "circle.fill"]
    default:
        return ["circle.fill", "circle.fill", "circle.fill"]
    }
    
}
