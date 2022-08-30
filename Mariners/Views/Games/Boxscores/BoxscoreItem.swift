//
//  BoxscoreItem.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct BoxscoreItem: View {
    @Binding var showLoading: Bool
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
                BoxscoreInnings(game: game)
                // totals
                BoxscoreTotals(game: game)
            }
        }
        .padding(.top, 20)
//        .redacted(reason: showLoading ? .placeholder : [])
    }
}

struct BoxscoreItem_Previews: PreviewProvider {
    static var previews: some View {
        BoxscoreItem(showLoading: .constant(false), game: ModelData().scores.league.games[0].game)
    }
}
