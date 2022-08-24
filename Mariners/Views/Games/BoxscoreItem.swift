//
//  BoxscoreItem.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct BoxscoreItem: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var showLoading: Bool
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
//                Spacer()
            }
        }
        .padding(.top, 20)
//        .redacted(reason: showLoading ? .placeholder : [])
    }
}

//struct BoxscoreItem_Previews: PreviewProvider {
//    static var previews: some View {
//        BoxscoreItem(isLoading: false, game: ModelData().scores.league.games[0].game)
//    }
//}
