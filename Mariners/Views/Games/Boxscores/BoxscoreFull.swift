//
//  BoxscoreFull.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct BoxscoreFull: View {
    @EnvironmentObject var modelData: ModelData
    var game: Game
    
    var body: some View {
        HStack {
            // teams
            Group {
                VStack(alignment: .leading, spacing: 10) {
                    Text("")
                    Text(game.away.abbr)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                    Text(game.home.abbr)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                }
                Spacer()
                // innings
                InningScores(away: getScores("away", game), home: getScores("home", game))
                // totals
                InningTotals(game: game)
            }
        }
        .padding(.top, 20)
    }
}

struct BoxscoreFull_Previews: PreviewProvider {
    static var previews: some View {
        BoxscoreFull(game: ModelData().scores.league.games[0].game)
    }
}
