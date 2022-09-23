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
    var keys = Keys()
}
