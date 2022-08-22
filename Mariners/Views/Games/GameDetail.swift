//
//  GameDetail.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import SwiftUI

struct GameDetail: View {
    @EnvironmentObject var modelData: ModelData
    var game: Game
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    Image(game.awayInits)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                Text(String(game.awayScore))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
                VStack(alignment: .center) {
                    InningView(inning: game.inning, inningHalf: game.inningHalf)
                    OutsView(outStrings: getOutsStrings(input: game.outs))
                }
                .font(.caption)
                
                Text(String(game.homeScore))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(20)
                VStack {
                    Image(game.homeInits)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}

struct GamesDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameDetail(game: ModelData().games[0])
    }
}
