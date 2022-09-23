//
//  StandingsView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/16/22.
//

import SwiftUI

struct StandingsView: View {
    @ObservedObject var viewModel = StandingsViewModel()
    @State private var showLoading: Bool = true
    
    var body: some View {
        List(viewModel.standings.league.season!.leagues, id: \.id) { league in
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
//                    StandingItem(division: division)
                    Divider()
                }
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
//        .redacted(reason: showLoading ? .placeholder : [])
        .navigationTitle("Standings")
        .refreshable {
            showLoading = true
            viewModel.getData()
            showLoading = false
        }
        .task {
            showLoading = true
            viewModel.getData()
            showLoading = false
        }
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView()
            .environmentObject(GlobalVariables())
    }
}
