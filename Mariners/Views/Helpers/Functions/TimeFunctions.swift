//
//  TimeFunctions.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/21/22.
//

import Foundation


func getDateComponent(_ date: Date, _ component: String) -> String {
    let formatter = DateFormatter()
    if component == "Y" {
        formatter.dateFormat = "yyyy"
    } else if component == "M" {
        formatter.dateFormat = "MM"
    } else { // return day
        formatter.dateFormat = "dd"
    }
    return formatter.string(from: date)
}

func getStartTime(_ isoDate: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from: isoDate)! //2018-02-07 12:46:00 +0000
    dateFormatter.dateFormat = "HH"
    let hour = dateFormatter.string(from: date)
    dateFormatter.dateFormat = "mm"
    let minute = dateFormatter.string(from: date)
    
    return "\(hour):\(minute)"

}
