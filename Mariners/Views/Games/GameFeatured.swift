//
//  GameFeatured.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct GameFeatured: View {
    @EnvironmentObject var modelData: ModelData
    @State private var leagues = [League]()
    
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
            NavigationLink {
                GameDetail(game: game)
            } label: {
                GameRow(game: game)
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/seasons/2022/REG/standings.json?api_key=wnfa3bdarch3hxhh8jv64znu") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let standings = try? JSONDecoder().decode(Standings.self, from: jsonData) {
                leagues = standings.league.season!.leagues
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct GameFeatured_Previews: PreviewProvider {
    static var previews: some View {
        GameFeatured(game: ModelData().games[0])
    }
}
