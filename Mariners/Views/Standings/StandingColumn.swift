//
//  StandingColumn.swift
//  Mariners
//
//  Created by Gavin Daniel on 9/23/22.
//

import SwiftUI

struct StandingColumn: View {
    var title: String
    var align: SwiftUI.HorizontalAlignment
    var teams: [Team]
    
    var body: some View {
        VStack(alignment: align, spacing: 20) {
            Text(title)
                .foregroundColor(.secondary)
            ForEach (teams) { team in
                if title == "W" { Text(String(team.win ?? -1)) }
                else if title == "L" { Text(String(team.loss ?? -1)) }
                else if title == "PCT" { Text(String(team.winP ?? -1)) }
                else if title == "GB" {
                    if (team.gamesBack == 0.0) { Text("-") }
                    else { Text(String(team.gamesBack ?? -1)) }
                }
                else if title == "L10" { Text(String(team.last10_Won ?? -1) + "-" + String(team.last10_Lost ?? -1)) }
                else if title == "STRK" { Text(team.streak ?? "-1") }
                else { Text(team.name) }
            }
        }
    }
}

struct StandingColumn_Previews: PreviewProvider {
    static var previews: some View {
        StandingColumn(title: "West", align: .leading, teams: ModelData().standings.league.season!.leagues[0].teams!)
    }
}
