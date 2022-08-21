//
//  BoxscoreRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct BoxscoreRow: View {
    @EnvironmentObject var modelData: ModelData
    var game: GameGame
//    var game: Game
    
    var body: some View {
        HStack {
            VStack {
                Image("circle-logo")
                    .resizable()
                    .frame(width: 30, height: 30)
                Image("circle-logo")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            // names
            if (game.away.runs > game.home.runs) {
                VStack(alignment: .leading) {
                    Text(game.away.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                    Text(game.home.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
            } else {
                VStack {
                    Text(game.away.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 5)
                    Text(game.home.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
            }
            Spacer()
            // score
            if (game.away.runs > game.home.runs) {
                VStack {
                    Text(String(game.away.runs))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                    Text(String(game.home.runs))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
                .padding(.trailing, 10)
            } else {
                VStack {
                    Text(String(game.away.runs))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 5)
                    Text(String(game.home.runs))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .padding(.trailing, 10)
            }
            // hits
            if (game.away.runs > game.home.runs) {
                VStack {
                    Text(String(game.away.hits))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                    Text(String(game.home.hits))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
                .padding(.trailing, 10)
            } else {
                VStack {
                    Text(String(game.away.hits))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                    Text(String(game.home.hits))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
                .padding(.trailing, 10)
            }
            // errors
            if (game.away.runs > game.home.runs) {
                VStack {
                    Text(String(game.away.errors))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                    Text(String(game.home.errors))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
                .padding(.trailing, 10)
            } else {
                VStack {
                    Text(String(game.away.errors))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 5)
                    Text(String(game.home.errors))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .padding(.trailing, 10)
            }
        }
        .padding(20)
    }
}

//struct BoxscoreRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BoxscoreRow(game: ModelData().games[0])
//    }
//}