//
//  BoxscoreSimple.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct BoxscoreSimple: View {
//    @Binding var showLoading: Bool
    @EnvironmentObject var modelData: ModelData
    //    @State private var animationAmount = 5.0
    var game: Game
    
    var body: some View {
        HStack {
            VStack {
                Image(game.away.abbr)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
//                    .padding(.bottom, 5)
                Image(game.home.abbr)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
            .padding(.trailing, 5)
            .offset(y: 15)
            // names
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    if game.status.rawValue == "scheduled" { // game hasn't started
                        ScheduledView(game: game)
                    } else if game.status.rawValue == "inprogress" { // game is in progress
                        if game.outcome != nil {
                            InningView(inning: game.outcome!.currentInning, inningHalf: game.outcome!.currentInningHalf)
                        }
                    } else { // status == closed , game is over
                        Text("Final")
                            .foregroundColor(.secondary)
                            .font(.footnote)
                    }
                }
                .padding(.bottom, 5)
                Text(game.away.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("away", game))
                    .padding(.bottom, 5)
                Text(game.home.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("home", game))
            }
            Spacer()
            // score
            VStack(alignment: .center) {
                Text("R")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)
                    .unredacted()
                Text(String(game.away.runs))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("away", game))
                    .padding(.bottom, 5)
                Text(String(game.home.runs))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("home", game))
            }
            .padding(.trailing, 10)
            // hits
            VStack(alignment: .center) {
                Text("H")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)
                    .unredacted()
                Text(String(game.away.hits))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("away", game))
                    .padding(.bottom, 5)
                Text(String(game.home.hits))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("home", game))
            }
            .padding(.trailing, 10)
            // errors
            VStack(alignment: .center) {
                Text("E")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)
                    .unredacted()
                Text(String(game.away.errors))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("away", game))
                    .padding(.bottom, 5)
                Text(String(game.home.errors))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(getColor("home", game))
            }
            .padding(.trailing, 10)
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
//        .redacted(reason: showLoading ? .placeholder : [])
//        .animation(.easeInOut, value: !showLoading)
//        .animation(
//            .easeInOut(duration: 5)
//                .delay(2),
//            value: animationAmount
//        )
    }
}

struct BoxscoreSimple_Previews: PreviewProvider {
    static var previews: some View {
        BoxscoreSimple(game: ModelData().scores.league.games[2].game)
    }
}
