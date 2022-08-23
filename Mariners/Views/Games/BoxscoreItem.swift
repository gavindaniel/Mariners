//
//  BoxscoreItem.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct BoxscoreItem: View {
    @EnvironmentObject var modelData: ModelData
    var isLoading: Bool
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
                    Text(game.home.abbr)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                Spacer()
                // innings
                BoxscoreInnings(game: game)
                // totals
                BoxscoreTotals(game: game)
                Spacer()
            }
        }
        .padding(10)
        .redacted(reason: isLoading ? .placeholder : [])
    }
}

struct BoxscoreItem_Previews: PreviewProvider {
    static var previews: some View {
        BoxscoreItem(isLoading: false, game: ModelData().scores.league.games[0].game)
    }
}
