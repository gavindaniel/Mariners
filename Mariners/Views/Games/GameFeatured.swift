//
//  GameFeatured.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct GameFeatured: View {
    @EnvironmentObject var modelData: ModelData
    
    var game: Game
    
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
            HStack {
                VStack {
                    game.awayLogo
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                Text(String(game.awayScore))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(20)
                VStack {
//                    Text(game.inningHalf + " " + game.inning)
//                        .foregroundColor(Color.red)
//                    Text(game.outs == 1 ? "\(game.outs) Out" : "\(game.outs) Outs")
                    HStack(alignment: .center) {
                        if game.inningHalf == "Top" { Label("", systemImage: "arrowtriangle.up.fill")
                                .offset(x: 10, y: -3)
                        } else { Label("", systemImage: "arrowtriangle.down.fill")
                                .offset(x: 10, y: -3)
                        }
                        Text(game.inning)
                            .font(.callout)
                    }
                    HStack {
                        if game.outs == 0 {
                            Label("", systemImage: "circle")
                            Label("", systemImage: "circle")
                            Label("", systemImage: "circle")
                        } else if game.outs == 1 {
                            Label("", systemImage: "circle.fill")
                            Label("", systemImage: "circle")
                            Label("", systemImage: "circle")
                        } else if game.outs == 2 {
                            Label("", systemImage: "circle")
                            Label("", systemImage: "circle.fill")
                            Label("", systemImage: "circle.fill")
                        } else {
                            Label("", systemImage: "circle.fill")
//                                .frame(width: 5, height: 5)
                            Label("", systemImage: "circle.fill")
                            Label("", systemImage: "circle.fill")
                        }
                    }
                }
                .font(.caption)
                
                Text(String(game.homeScore))
                    .font(.title)
                    .fontWeight(.bold)
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

struct GameFeatured_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        GameFeatured(game: modelData.games[0])
            .environmentObject(ModelData())
    }
}
