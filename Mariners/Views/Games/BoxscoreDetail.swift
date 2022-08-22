//
//  BoxscoreDetail.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/20/22.
//

import SwiftUI

struct BoxscoreDetail: View {
    @EnvironmentObject var modelData: ModelData
    var game: GameGame
//    var game: Game
    
    var body: some View {
        HStack {
            // teams
            Group {
                VStack(alignment: .leading) {
                    Text("")
                        .padding(.bottom, 5)
                    Text(game.away.abbr)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                    Text(game.home.abbr)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                }
                Spacer()
                // innings & totals
                Group {
                    // innings
                    Group {
                        VStack {
                            Text("1")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("2")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("3")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("4")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("5")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("6")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("7")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("8")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("9")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                    }
                    // totals
                    Group {
                        VStack {
                            Text("R")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("H")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Text("E")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 5)
                            Text(String(game.away.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            Text(String(game.home.runs))
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                        }
                    }
                }
                .padding(.trailing, 10)
            }
        }
        .padding(10)
    }
}

struct BoxscoreDetail_Previews: PreviewProvider {
    static var previews: some View {
        BoxscoreDetail(game: ModelData().scores.league.games[0].game)
    }
}
