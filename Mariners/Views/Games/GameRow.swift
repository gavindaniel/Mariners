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
                Image(game.away.abbr)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
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
            VStack(alignment: .center) {
                if checkFinal(game.status.rawValue) {
                    FinalView(awayRuns: game.away.runs, homeRuns: game.home.runs)
                } else {
                    InningView(inning: game.outcome!.currentInning, inningHalf: game.outcome!.currentInningHalf)
                    OutsView(outStrings: getOutsStrings(input: game.outcome!.count.outs))
                }
            }
//            .font(.caption)
            Spacer()
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
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
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
