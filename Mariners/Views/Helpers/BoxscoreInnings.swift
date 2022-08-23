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
                // 1st
                VStack(alignment: .center, spacing: 10) {
                    Text("1")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(game.away.scoring[0].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    Text(String(game.home.scoring[0].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                .padding(5)
                // 2nd
                VStack(alignment: .center, spacing: 10) {
                    Text("2")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(game.away.scoring[1].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    Text(String(game.home.scoring[1].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                .padding(5)
                // 3rd
                VStack(alignment: .center, spacing: 10) {
                    Text("3")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(game.away.scoring[2].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    Text(String(game.home.scoring[2].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                .padding(5)
                // 4th
                VStack(alignment: .center, spacing: 10) {
                    Text("4")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(game.away.scoring[3].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.scoring[3].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                // 5th
                VStack(alignment: .center, spacing: 10) {
                    Text("5")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.scoring[1].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.scoring[4].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                // 6th
                VStack(alignment: .center, spacing: 10) {
                    Text("6")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.scoring[5].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.scoring[5].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                // 7th
                VStack(alignment: .center, spacing: 10) {
                    Text("7")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.scoring[6].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.scoring[6].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                // 8th
                VStack(alignment: .center, spacing: 10) {
                    Text("8")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.scoring[7].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.scoring[7].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                // 9th
                VStack(alignment: .center, spacing: 10) {
                    Text("9")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.scoring[8].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.scoring[8].runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
            }
        }
    }
}

struct BoxscoreInnings_Previews: PreviewProvider {
    static var previews: some View {
        BoxscoreInnings(game: ModelData().scores.league.games[0].game)
    }
}
