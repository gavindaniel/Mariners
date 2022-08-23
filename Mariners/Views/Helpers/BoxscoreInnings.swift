//
//  BoxscoreInnings.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/22/22.
//

import SwiftUI

struct BoxscoreInnings: View {
    var game: Game
    
    var body: some View {
        HStack {
            Group {
                ForEach(0..<(game.away.scoring?.count ?? 9)) { i in
                    VStack(alignment: .center, spacing: 10) {
                        Text(String(i+1))
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Text(game.away.scoring![i].runs!)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(game.home.scoring![i].runs!)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    .padding(5)
                }
            }
        }
    }
}

struct BoxscoreInnings_Previews: PreviewProvider {
    static var previews: some View {
        BoxscoreInnings(game: ModelData().scores.league.games[0].game)
    }
}
