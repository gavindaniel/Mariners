//
//  Article.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import Foundation
import SwiftUI

struct Article: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var date: String
    var source: String
    var author: String
    var body: String

    
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
}
