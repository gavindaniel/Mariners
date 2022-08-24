//
//  BoxscoreRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct BoxscoreRow: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var showLoading: Bool
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
            // names
            VStack(alignment: .leading) {
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
            VStack {
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
            VStack {
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
            VStack {
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
        .padding(.top, 20)
        .padding(.bottom, 20)
        .redacted(reason: showLoading ? .placeholder : [])
    }
}

//struct BoxscoreRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BoxscoreRow(isLoading: false, game: ModelData().scores.league.games[0].game)
//    }
//}
