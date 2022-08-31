//
//  ViewModel.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/31/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var awayScore: Int = 0
    @Published var homeScore: Int = 0
}
