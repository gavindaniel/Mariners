//
//  StandingsView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/16/22.
//

import SwiftUI

struct StandingsView: View {
    @State private var showLoading: Bool = true
    @State private var leagues = ModelData().standings.league.season!.leagues
    
    var body: some View {
        List(leagues, id: \.id) { league in
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Image(league.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                    Text(league.name)
                }
                .padding(.top, 20)
                ForEach(league.divisions!) { division in
                    StandingItem(showLoading: $showLoading, division: division)
                    Divider()
                }
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
        
        .navigationTitle("Standings")
        .refreshable {
            await loadData()
        }
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
            showLoading = true
            let (jsonData, _) = try await URLSession.shared.data(from: url)
            
            if let standings = try? JSONDecoder().decode(Standings.self, from: jsonData) {
                leagues = standings.league.season!.leagues
                print("standings JSON decoded.")
                showLoading = false
            }
        } catch {
            print("Invalid data")
        }
    }
}

//struct StandingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StandingsView()
////        List { // next pattern easily wrapped with ForEach
////            ItemRow("Category", isCategory: true) // this can be section's header
////            Section {
////                ItemRow("Item 1")
////                ItemRow("Item 2")
////                ItemRow("Item 3")
////            }.padding(.leading, 20)
////        }
//    }
//}
