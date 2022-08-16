//
//  TestResponse.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/15/22.
//

import Foundation

struct TestResponse: Codable {
    var results: [Result]
    
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
