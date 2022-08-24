//
//  GameRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/17/22.
//

import SwiftUI

struct GameRow: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var showLoading: Bool
    var game: Game
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .center) {
                    Image(game.away.abbr)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                }
                Spacer()
                Text(String(game.away.runs))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("away", game))
                    .padding(10)
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
                Text(String(game.home.runs))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("home", game))
                    .padding(10)
                Spacer()
                VStack {
                    Image(game.home.abbr)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                }
            }
//            .offset(y: -20)
        }
        .padding(10)
//        .redacted(reason: showLoading ? .placeholder : [])
    }
}

//struct GameRow_Previews: PreviewProvider {
//    static var previews: some View {
//        GameRow(isLoading: false, game: ModelData().scores.league.games[0].game)
//    }
//}
