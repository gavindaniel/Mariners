//
//  GameRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/17/22.
//

import SwiftUI

struct GameRow: View {
    @EnvironmentObject var modelData: ModelData
//    @Binding var showLoading: Bool
    @State private var showLoading: Bool = false
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
                if game.status.rawValue != "scheduled" {
                    Text(String(game.away.win) + "-" + String(game.away.loss))
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else { // game in progress or ended, show score
                    Text(String(game.away.runs))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(getColor("away", game))
                        .padding(10)
                }
                Spacer()
                VStack(alignment: .center) {
                    if game.status.rawValue == "scheduled" { // game hasn't started
                        ScheduledView(game: game)
                    } else if game.status.rawValue == "inprogress" { // game is in progress
                        if game.outcome != nil {
                            InningView(inning: game.outcome!.currentInning, inningHalf: game.outcome!.currentInningHalf)
                            if game.outcome!.count != nil {
                                OutsView(outStrings: getOutsStrings(input: game.outcome!.count!.outs))
                            }
                        }
                    } else { // status == closed , game is over
                        FinalView(awayRuns: game.away.runs, homeRuns: game.home.runs)
                    }
                }
    //            .font(.caption)
                Spacer()
                if game.status.rawValue != "scheduled" {
                    Text(String(game.home.win) + "-" + String(game.home.loss))
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else { // game in progress or ended, show score
                    Text(String(game.home.runs))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(getColor("home", game))
                        .padding(10)
                }
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

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: ModelData().scores.league.games[5].game)
    }
}
