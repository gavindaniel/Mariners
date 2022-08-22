//
//  GameDetail.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import SwiftUI

struct GameDetail: View {
    @EnvironmentObject var modelData: ModelData
//    var game: Game
    var game: GameGame
    
    var body: some View {
        ScrollView {
            GameRow(game: game)
            BoxscoreDetail(game: game)
        }
    }
}

struct GamesDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameDetail(game: ModelData().scores.league.games[0].game)
    }
}
