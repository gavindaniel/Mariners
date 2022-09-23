//
//  InningTotals.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/22/22.
//

import SwiftUI

struct InningTotals: View {
    var game: Game
    
    var body: some View {
        HStack {
            Group {
                // runs
                VStack(alignment: .center, spacing: 10) {
                    Text("R")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        
                    Text(String(game.home.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        
                }
                .padding(5)
                // hits
                VStack(alignment: .center, spacing: 10) {
                    Text("H")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.hits))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        
                    Text(String(game.home.hits))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        
                }
                .padding(5)
                // errors
                VStack(alignment: .center, spacing: 10) {
                    Text("E")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.errors))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        
                    Text(String(game.home.errors))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                        
                }
                .padding(5)
            }
        }
    }
}

struct InningTotals_Previews: PreviewProvider {
    static var previews: some View {
        InningTotals(game: ModelData().scores.league.games[0].game)
    }
}
