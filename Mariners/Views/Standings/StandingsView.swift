//
//  StandingsView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/16/22.
//

import SwiftUI

struct StandingsView: View {
    @State private var leagues = [League]()
    
    var body: some View {
        List(leagues, id: \.id) { league in
            VStack(alignment: .leading) {
                Text(league.name)
                    .font(.headline)

            }
        } 
        
//        ForEach(leagues, id: \.id) { league in
//            List(league.divisions!, id: \.id) { division in
//                VStack(alignment: .leading) {
//                    Text(division.name)
//                        .font(.headline)
//
//                }
//            }
//        }
        
        .task {
            await loadData()
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

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView()
    }
}
