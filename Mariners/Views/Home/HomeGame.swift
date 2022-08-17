//
//  HomeGame.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/17/22.
//

import SwiftUI

struct HomeGame: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Text("Scores")
                    .font(.headline)

                Spacer()
                
                NavigationLink {
                    GameList()
                } label: {
                    Text("See All")
                        .foregroundColor(Color.blue)
                        .font(.caption)
                }
            }
            .padding(.top, 10)
            Divider()
            GameDetail(game: modelData.games[0])
        }
    }
}

struct HomeGame_Previews: PreviewProvider {
    static var previews: some View {
        HomeGame()
            .environmentObject(ModelData())
    }
}
