//
//  Tweet.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import Foundation
import SwiftUI

struct Tweet: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var time: String
    var body: String
    
    private var imageName: String
    var profileImage: Image {
        Image(imageName)
    }
}
