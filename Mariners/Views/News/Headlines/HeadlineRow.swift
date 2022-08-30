//
//  HeadlineRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct HeadlineRow: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var sessionManager: SessionManager
    
    let article: Article
    
    var body: some View {
        HStack(alignment: .center) {
            Label("", systemImage: "book")
                .foregroundColor(.primary)
            Text(article.title) // ?? "Title"
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding(.top, 10)
        .padding(.leading, 10)
        .padding(.bottom, 10)
    }
}

struct HeadlineRow_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineRow(article: ModelData().articles[0])
    }
}
