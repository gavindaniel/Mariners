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
        
//        List(leagues, id: \.id) { league in
//            Section(header: Text(league.name)) {
//                ForEach(league.divisions!) { division in
//                    Section(header: Text(division.name)) {
//                        ForEach(division.teams!) { team in
//                            Text(team.name)
//                        }
//                    }
//                }
//            }
//        }
        
        List(leagues, id: \.id) { league in
//            Section(header: Text(league.name)) {
                VStack(alignment: .leading) {
                    ScrollView(showsIndicators: false) {
                        ForEach(league.divisions!) { division in
    //                        NavigationLink {
    //                            NewsDetail(article: article)
    //                        } label: {
    //                            NewsRow(article: article)
    //                        }
                            StandingItem(division: division)
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
//            }
            
        }
        .listStyle(.inset)
        .navigationTitle("Standings")
        
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
