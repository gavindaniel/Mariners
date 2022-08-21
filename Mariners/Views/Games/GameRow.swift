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
    
    var body: some View {        
        HStack {
            VStack {
                game.awayLogo
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            Spacer()
            if checkGameFinal(game.inning, game.inningHalf, game.outs) {
                if (game.awayScore > game.homeScore) {
                Text(String(game.awayScore))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
                } else {
                Text(String(game.awayScore))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding(20)
                }
            } else {
                Text(String(game.awayScore))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
            }
            Spacer()
            VStack(alignment: .center) {
                if checkGameFinal(game.inning, game.inningHalf, game.outs) {
                    Text("Final")
                        .foregroundColor(.red)
                } else {
                    InningView(inning: game.inning, inningHalf: game.inningHalf)
                    OutsView(outStrings: getOutsStrings(input: game.outs))
                }
            }
            .font(.caption)
            Spacer()
            if checkGameFinal(game.inning, game.inningHalf, game.outs) {
                if (game.homeScore > game.awayScore) {
                Text(String(game.homeScore))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
                } else {
                Text(String(game.homeScore))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding(20)
                }
            } else {
                Text(String(game.homeScore))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
            }
            Spacer()
            VStack {
                game.homeLogo
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .padding(20)
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: ModelData().games[0])
    }
}
