//
//  InningText.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/23/22.
//

import SwiftUI

struct InningText: View {
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
                .font(.callout)
                .foregroundColor(.primary)
        }
    }
}

struct InningText_Previews: PreviewProvider {
    static var previews: some View {
        InningText(inning: 1, inningHalf: "B")
    }
}
