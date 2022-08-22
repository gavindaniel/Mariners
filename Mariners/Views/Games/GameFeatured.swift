//
//  GameFeatured.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct GameFeatured: View {
    @EnvironmentObject var modelData: ModelData
    var game: GameGame
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Text("Scores")
                    .font(.title3)
                    .fontWeight(.semibold)

                Spacer()
                
                NavigationLink {
                    GameList()
                } label: {
                    Text("See All")
                        .foregroundColor(Color.blue)
                        .font(.callout)
                }
            }
            .padding(.top, 10)
            Divider()
            NavigationLink {
                GameDetail(game: game)
            } label: {
                GameRow(game: game)
            }
        }
    }
}

struct GameFeatured_Previews: PreviewProvider {
    static var previews: some View {
        GameFeatured(game: ModelData().scores.league.games[0].game)
    }
}
