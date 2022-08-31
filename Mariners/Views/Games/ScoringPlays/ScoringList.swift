//
//  ScoringList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//

import SwiftUI

struct ScoringList: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var globalVariables: GlobalVariables
    @StateObject var scoringViewModel = ScoringViewModel()
    var events: [Event]
    var away: String
    var home: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Scoring Plays")
                    .fontWeight(.semibold)
                Spacer()
            }
            .font(.footnote)
            .foregroundColor(.primary)
            Divider()
            ForEach(events) { event in
                ScoringRow(event: event, away: away, home: home)
                    .environmentObject(scoringViewModel)
                Divider()
            }
        }
        .padding(.top, 20)
    }
}

struct ScoringList_Previews: PreviewProvider {
    static var previews: some View {
        ScoringList(events: mergeEvents(ModelData().score.game.away.events!, ModelData().score.game.home.events!), away: "MIL", home: "CHC")
            .environmentObject(ModelData())
    }
}
