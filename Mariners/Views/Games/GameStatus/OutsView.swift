//
//  OutsView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/17/22.
//

import SwiftUI

struct OutsView: View {
    var outStrings: [String]
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: outStrings[0])
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(.primary)
            Image(systemName: outStrings[1])
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(.primary)
            Image(systemName: outStrings[2])
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(.primary)
        }
    }
}

struct OutsView_Previews: PreviewProvider {
    static var previews: some View {
        OutsView(outStrings: getOutsStrings(input: 3))
    }
}
