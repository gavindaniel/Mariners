//
//  GameFeatured.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct GameFeatured: View {
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

struct GameFeatured_Previews: PreviewProvider {
    static var previews: some View {
        GameFeatured()
            .environmentObject(ModelData())
    }
}
