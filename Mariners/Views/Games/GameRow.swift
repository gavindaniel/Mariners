//
//  GameRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/17/22.
//

import SwiftUI

struct GameRow: View {
    @EnvironmentObject var modelData: ModelData
//    var game: Game
    var game: GameGame
    
    var body: some View {        
        HStack {
            VStack {
                Image(game.away.abbr)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            Spacer()
            if checkFinal(game.status.rawValue) {
                if (game.away.runs > game.home.runs) {
                    Text(String(game.away.runs))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
                } else {
                    Text(String(game.away.runs))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding(20)
                }
            } else {
                Text(String(game.away.runs))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
            }
            Spacer()
//            VStack(alignment: .center) {
//                if checkGameFinal(game.inning, game.inningHalf, game.outs) {
//                    Text("Final")
//                        .foregroundColor(.red)
//                } else {
//                    InningView(inning: game.inning, inningHalf: game.inningHalf)
//                    OutsView(outStrings: getOutsStrings(input: game.outs))
//                }
//            }
//            .font(.caption)
//            Spacer()
            if checkFinal(game.status.rawValue) {
                if (game.home.runs > game.away.runs) {
                Text(String(game.home.runs))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
                } else {
                Text(String(game.home.runs))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding(20)
                }
            } else {
                Text(String(game.home.runs))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
            }
            Spacer()
            VStack {
                Image(game.home.abbr)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .padding(20)
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: ModelData().scores.league.games[0].game)
    }
}
