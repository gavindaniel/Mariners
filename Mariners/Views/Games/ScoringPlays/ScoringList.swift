//
//  ScoringList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//

import SwiftUI

struct ScoringList: View {
    @Binding var showLoading: Bool
    @EnvironmentObject var modelData: ModelData
    var events: [Event]
    var away: String
    var home: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Inning")
                    .padding(.leading, 10)
//                    .unredacted()
                Spacer()
                Text(away)
                    .padding(.trailing, 5)
                Text(home)
                    .padding(.trailing, 10)
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            Divider()
            ForEach(events) { event in
                ScoringRow(showLoading: $showLoading, event: event)
                Divider()
            }
        }
        .padding(.top, 20)
    }
}

struct ScoringList_Previews: PreviewProvider {
    static var previews: some View {
        ScoringList(showLoading: .constant(false), events: mergeEvents(ModelData().score.game.away.events!, ModelData().score.game.home.events!), away: "MIL", home: "CHC")
    }
}
