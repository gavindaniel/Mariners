//
//  StandingsView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/16/22.
//

import SwiftUI

struct StandingsView: View {
    @StateObject private var viewModel = ViewModel()
    
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
                    StandingItem(division: division)
                    Divider()
                }
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
        .redacted(reason: viewModel.showLoading ? .placeholder : [])
        .navigationTitle("Standings")
        .refreshable {
            viewModel.getData()
        }
        .task {
            viewModel.getData()
        }
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView()
            .environmentObject(GlobalVariables())
    }
}
