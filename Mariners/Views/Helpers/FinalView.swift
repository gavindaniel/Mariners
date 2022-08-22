//
//  FinalView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/22/22.
//

import SwiftUI

struct FinalView: View {
    var awayRuns, homeRuns: Int
    
    var body: some View {
        if (awayRuns > homeRuns) {
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
        } else {
            HStack {
                Text("Final")
                    .foregroundColor(.primary)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(5)
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.primary)
            }
            .padding(.leading, 15)
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView(awayRuns: 1, homeRuns: 2)
    }
}
