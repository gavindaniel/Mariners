//
//  LineScoreFull.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct LineScoreFull: View {
    @EnvironmentObject var modelData: ModelData
    var game: Game
    
    var body: some View {
        VStack {
            HStack {
                // teams
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
            if game.pitching != nil {
                PitchingView(pitching: game.pitching!)
            }
        }
    }
}

struct LineScoreFull_Previews: PreviewProvider {
    static var previews: some View {
        LineScoreFull(game: ModelData().score.game)
    }
}
