//
//  ModelData.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var tweets: [Tweet] = load("tweetData.json")
    var articles: [Article] = load("articleData.json")
    var scores: DailyBoxscore = load("boxscoreData.json")
    var score: GameBoxscore = load("gameData.json")
    var standings: Standings = load("standingsData.json")
    @Published var settings = Settings.default
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self)\n\n\(error)")
    }
}
