//
//  BoxscoreDetail.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct BoxscoreDetail: View {
    @EnvironmentObject var modelData: ModelData
//    var game: GameGame
    var game: Game
    
    var body: some View {
        HStack {
            VStack {
                Text(game.awayName)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(game.homeName)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            VStack {
                Text("1")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(String(game.awayScore))
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(String(game.homeScore))
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct BoxscoreDetail_Previews: PreviewProvider {
    static var previews: some View {
        BoxscoreDetail(game: ModelData().games[0])
    }
}
