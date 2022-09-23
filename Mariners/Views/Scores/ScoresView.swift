//
//  ScoresView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import SwiftUI

struct ScoresView: View {
    @EnvironmentObject var globalVariables: GlobalVariables
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        List {
            DateView()
                .environmentObject(globalVariables)
            ForEach(viewModel.scores.league.games) { game in
                NavigationLink {
                    ScoreDetail(gameID: game.game.id)
                } label: {
                    LineScoreSimple(game: game.game)
                }
                .padding()
                Divider()
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
        .navigationTitle("Scores")
        .redacted(reason: viewModel.showLoading ? .placeholder : [])
        .refreshable {
            // FIXME: remove debug print later
            print(getDateComponents(globalVariables.myDate))
            viewModel.getData(date: getDateComponents(globalVariables.myDate))
        }
        .task {
            // FIXME: remove debug print later
            print(getDateComponents(globalVariables.myDate))
            viewModel.getData(date: getDateComponents(globalVariables.myDate))
        }
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
            .environmentObject(ModelData())
            .environmentObject(GlobalVariables())
    }
}
