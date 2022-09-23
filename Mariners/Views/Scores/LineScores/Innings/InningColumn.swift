//
//  InningColumn.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/30/22.
//

import SwiftUI

struct InningColumn: View {
    var inning: Int
    var away: String
    var home: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(String(inning))
                .font(.caption2)
                .foregroundColor(.secondary)
            Text(away)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.top, 5)
            Text(home)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.top, 5)
        }
        .padding(5)
    }
}

struct InningColumn_Previews: PreviewProvider {
    static var previews: some View {
        InningColumn(inning: 1, away: "0", home: "0")
    }
}
