//
//  ScoreFeatured.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct ScoreFeatured: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var globalVariables: GlobalVariables
    var game: Game
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Text("Scores")
                    .font(.title3)
                    .fontWeight(.semibold)

                Spacer()
                
                NavigationLink {
                    ScoresView()
                        .environmentObject(globalVariables)
                } label: {
                    Text("See All")
                        .foregroundColor(Color.blue)
                        .font(.callout)
                }
            }
            .padding(.top, 10)
            Divider()
            NavigationLink {
                ScoreDetail(gameID: game.id)
            } label: {
                ScoreRow(game: game)
            }
        }
    }
}

struct ScoreFeatured_Previews: PreviewProvider {
    static var previews: some View {
        ScoreFeatured(game: ModelData().scores.league.games[0].game)
    }
}
