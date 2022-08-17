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
            VStack(alignment: .leading, spacing: 15) {
                Text(division.name)
                ForEach (division.teams!) { team in
                    Text(team.name)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 15) {
                Text("W")
                ForEach (division.teams!) { team in
                    Text(String(team.win))
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .trailing, spacing: 15) {
                Text("L")
                ForEach (division.teams!) { team in
                    Text(String(team.loss))
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .trailing, spacing: 15) {
                Text("PCT")
                ForEach (division.teams!) { team in
                    Text(String(team.winP))
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .center, spacing: 15) {
                Text("GB")
                ForEach (division.teams!) { team in
                    Text(String(team.gamesBack))
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .trailing, spacing: 15) {
                Text("L10")
                ForEach (division.teams!) { team in
                    Text(String(team.last10_Won) + "-" + String(team.last10_Lost))
                }
            }
            .padding(.trailing, 15)
            VStack(alignment: .trailing, spacing: 15) {
                Text("STRK")
                ForEach (division.teams!) { team in
                    Text(team.streak)
                }
            }
        }
        .font(.caption)
    }
}

//struct StandingItem_Previews: PreviewProvider {
//    static var previews: some View {
//        StandingItem()
//    }
//}
