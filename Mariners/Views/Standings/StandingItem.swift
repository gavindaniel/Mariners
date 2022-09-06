//
//  StandingItem.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/16/22.
//

import SwiftUI

struct StandingItem: View {
    @Binding var showLoading: Bool
    var division: League
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text(division.name)
                    .foregroundColor(.secondary)
                ForEach (division.teams!) { team in
                    Text(team.name)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 20) {
                Text("W")
                    .foregroundColor(.secondary)
                ForEach (division.teams!) { team in
                    Text(String(team.win))
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .trailing, spacing: 20) {
                Text("L")
                    .foregroundColor(.secondary)
                ForEach (division.teams!) { team in
                    Text(String(team.loss))
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .trailing, spacing: 20) {
                Text("PCT")
                    .foregroundColor(.secondary)
                ForEach (division.teams!) { team in
                    Text(String(team.winP))
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .center, spacing: 20) {
                Text("GB")
                    .foregroundColor(.secondary)
                ForEach (division.teams!) { team in
                    if (team.gamesBack == 0.0) { Text("-") }
                    else { Text(String(team.gamesBack)) }
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .trailing, spacing: 20) {
                Text("L10")
                    .foregroundColor(.secondary)
                ForEach (division.teams!) { team in
                    Text(String(team.last10_Won) + "-" + String(team.last10_Lost))
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .trailing, spacing: 20) {
                Text("STRK")
                    .foregroundColor(.secondary)
                ForEach (division.teams!) { team in
                    Text(team.streak)
                }
            }
        }
        .font(.caption)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .redacted(reason: showLoading ? .placeholder : [])
    }
}

struct StandingItem_Previews: PreviewProvider {
    static var previews: some View {
        StandingItem(showLoading: .constant(false), division: ModelData().standings.league)
//        StandingItem(division: ModelData().standings.league)
    }
}
