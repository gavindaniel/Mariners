//
//  GameRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/17/22.
//

import SwiftUI

struct GameRow: View {
    @EnvironmentObject var modelData: ModelData
    var game: Game
    
    var gameIndex: Int {
        modelData.games.firstIndex(where: { $0.id == game.id })!
    }
    
    var body: some View {
        HStack {
            VStack {
                game.awayLogo
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(game.awayInits)
                    .font(.caption2)
                    .fontWeight(.bold)
                Text(game.awayRecord)
                    .font(.caption2)
                    .foregroundColor(Color.secondary)
            }
            Text(String(game.awayScore))
                .fontWeight(.bold)
                .padding(30)
            VStack {
                Text(game.inningHalf + " " + game.inning)
                    .foregroundColor(Color.red)
                Text(game.outs == 1 ? "\(game.outs) Out" : "\(game.outs) Outs")
            }
            .font(.caption)
            
            Text(String(game.homeScore))
                .fontWeight(.bold)
                .padding(30)
            VStack {
                game.homeLogo
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(game.homeInits)
                    .font(.caption2)
                    .fontWeight(.bold)
                Text(game.homeRecord)
                    .font(.caption2)
                    .foregroundColor(Color.secondary)
            }
        }
    }
}

struct GameRow_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        GameRow(game: modelData.games[0])
            .environmentObject(modelData)
    }
}
