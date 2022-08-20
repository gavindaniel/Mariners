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
    
    var gameIndex: Int {
        modelData.games.firstIndex(where: { $0.id == game.id })!
    }
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    game.awayLogo
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
                    game.homeLogo
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}

struct GamesDetail_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        GameDetail(game: modelData.games[0])
            .environmentObject(modelData)
    }
}
