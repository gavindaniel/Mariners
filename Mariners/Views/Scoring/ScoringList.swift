//
//  ScoringList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//

import SwiftUI

struct ScoringList: View {
    var away: String
    var home: String
    @State private var showLoading: Bool = true
    var events: [Event]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Inning")
                    .padding(.leading, 10)
                    .unredacted()
                Spacer()
                Text(away)
                    .padding(.trailing, 5)
                Text(home)
                    .padding(.trailing, 10)
            }
            .font(.footnote)
            .redacted(reason: showLoading ? .placeholder : [])
            Divider()
            ForEach(events) { event in
                ScoringRow(showLoading: $showLoading, aScore: 0, hScore: 0, event: event)
                Divider()
            }
        }
        .padding(.top, 20)
    }
}

//struct ScoringList_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoringList(away: "MIL", home: "CHC", showLoading: false, events: mergeEvents(ModelData().score.game.away.events!, ModelData().score.game.home.events!))
//    }
//}
