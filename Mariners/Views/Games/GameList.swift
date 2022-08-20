//
//  GameList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import SwiftUI

struct GameList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            ForEach(modelData.games) { game in
                NavigationLink {
                    GameDetail(game: game)
                } label: {
                    GameRow(game: game)
                }
                
                Divider()
            }
        }
        .navigationTitle("Scores")
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
            .environmentObject(ModelData())
    }
}
