//
//  BoxscoreInnings.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/22/22.
//

import SwiftUI

struct BoxscoreInnings: View {
//    var game: Game
    var away: [String]
    var home: [String]
    
    var body: some View {
        HStack {
            Group {
                ForEach(0..<9) { i in
//                    InningColumn(inning: i+1, scores: getInning())
                    InningColumn(inning: i+1, away: away[i], home: home[i])
                }
            }
        }
    }
}

//struct BoxscoreInnings_Previews: PreviewProvider {
//    static var previews: some View {
//        BoxscoreInnings(away: ModelData().scores.league.games[0].game)
//    }
//}
