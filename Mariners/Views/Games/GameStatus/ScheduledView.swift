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
            Image(systemName: "arrowtriangle.left.fill")
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(.primary)
            Text("Final")
                .foregroundColor(.primary)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(5)
        }
        .padding(.trailing, 15)
    }
}

struct ScheduledView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduledView(game: ModelData().score.game)
    }
}
