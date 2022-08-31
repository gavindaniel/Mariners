//
//  PitchingView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/31/22.
//

import SwiftUI

struct PitchingView: View {
    var pitching: Pitching
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                PitchingItem(outcome: "W", pitcher: pitching.win)
                    .padding(.trailing, 20)
                if pitching.save != nil {
                    PitchingItem(outcome: "S", pitcher: pitching.save!)
                }
            }
            Spacer()
            PitchingItem(outcome: "L", pitcher: pitching.loss)
        }
        .font(.caption2)
        .foregroundColor(.secondary)
    }
}

struct PitchingView_Previews: PreviewProvider {
    static var previews: some View {
        PitchingView(pitching: ModelData().score.game.pitching!)
    }
}
