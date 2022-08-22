//
//  TimeFunctions.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/21/22.
//

import Foundation

func getDateComponents() -> [String] {
    let date = Date.now
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    let year = formatter.string(from: date)
    formatter.dateFormat = "MM"
    let month = formatter.string(from: date)
    formatter.dateFormat = "dd"
    let day = formatter.string(from: date)
    print(year, month, day) // 2018 12 24
    return [year, month, day]
}
