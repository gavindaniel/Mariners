//
//  StandingItem.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/16/22.
//

import SwiftUI

struct StandingItem: View {
    var division: League
    
    var body: some View {
        HStack {
            StandingColumn(title: division.name, align: .leading, teams: division.teams!)
            Spacer()
            StandingColumn(title: "W", align: .trailing, teams: division.teams!)
            .padding(.trailing, 15)
            StandingColumn(title: "L", align: .trailing, teams: division.teams!)
            .padding(.trailing, 15)
            StandingColumn(title: "PCT", align: .trailing, teams: division.teams!)
            .padding(.trailing, 15)
            StandingColumn(title: "GB", align: .trailing, teams: division.teams!)
            .padding(.trailing, 15)
            StandingColumn(title: "L10", align: .trailing, teams: division.teams!)
            .padding(.trailing, 15)
            StandingColumn(title: "STRK", align: .trailing, teams: division.teams!)
        }
        .font(.caption)
        .padding(.top, 20)
        .padding(.bottom, 20)
    }
}

struct StandingItem_Previews: PreviewProvider {
    static var previews: some View {
        StandingItem(division: ModelData().standings.league)
    }
}
