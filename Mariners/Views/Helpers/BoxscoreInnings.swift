//
//  BoxscoreInnings.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/22/22.
//

import SwiftUI

struct BoxscoreInnings: View {
    var game: GameGame
    
    var body: some View {
        HStack {
            Group {
                VStack(alignment: .center, spacing: 10) {
                    Text("1")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    Text(String(game.home.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                .padding(5)
                VStack(alignment: .center, spacing: 10) {
                    Text("2")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    Text(String(game.home.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                .padding(5)
                VStack(alignment: .center, spacing: 10) {
                    Text("3")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    Text(String(game.home.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                .padding(5)
                VStack(alignment: .center, spacing: 10) {
                    Text("4")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                VStack(alignment: .center, spacing: 10) {
                    Text("5")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                VStack(alignment: .center, spacing: 10) {
                    Text("6")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                VStack(alignment: .center, spacing: 10) {
                    Text("7")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                VStack(alignment: .center, spacing: 10) {
                    Text("8")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                }
                .padding(5)
                VStack(alignment: .center, spacing: 10) {
                    Text("9")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        
                    Text(String(game.away.runs))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                    Text(String(game.home.runs))
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
