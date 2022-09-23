//
//  PitchingItem.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/31/22.
//

import SwiftUI

struct PitchingItem: View {
    var outcome: String
    var pitcher: Loss
    
    var body: some View {
        HStack {
            if outcome != "S" {
                Text(outcome + " :  ")
                + Text(pitcher.preferredName + " " + pitcher.lastName)
                + Text(" (" + String(pitcher.win) + "-" + String(pitcher.loss) + ")")
            } else {
                Text(outcome + " :  ")
                + Text(pitcher.preferredName + " " + pitcher.lastName)
                + Text(" (" + String(pitcher.save) + ")")
            }
        }
    }
}

struct PitchingItem_Previews: PreviewProvider {
    static var previews: some View {
        PitchingItem(outcome: "W", pitcher: ModelData().score.game.pitching!.win)
    }
}
