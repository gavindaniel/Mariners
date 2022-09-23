//
//  InningView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/17/22.
//

import SwiftUI

struct InningView: View {
    var inning: Int
    var inningHalf: String
    
    var body: some View {
        HStack(alignment: .center) {
            if inningHalf == "T" {
                Image(systemName: "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.primary)
            } else {
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.primary)
            }
            Text(getInningText(input: inning))
                .font(.footnote) // callout
                .foregroundColor(.primary)
        }
    }
}

struct InningView_Previews: PreviewProvider {
    static var previews: some View {
        InningView(inning: 1, inningHalf: "B")
    }
}
