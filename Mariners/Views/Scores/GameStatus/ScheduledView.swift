//
//  ScheduledView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/24/22.
//

import SwiftUI

struct ScheduledView: View {
    var game: Game
    
    var body: some View {
        HStack {
            Text(getStartTime(game.scheduled))
                .foregroundColor(.secondary)
                .font(.footnote)
        }
    }
}

struct ScheduledView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduledView(game: ModelData().scores.league.games[0].game)
    }
}
