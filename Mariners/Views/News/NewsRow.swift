//
//  NewsRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import SwiftUI

struct NewsRow: View {
    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var sessionManager: SessionManager
    
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
//            article.image
            Image("ty-france")
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(article.title ?? "Title")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                Text((article.date ?? "Date")! + " • " + (article.source ?? "Source"))
                    .font(.footnote)
                    .foregroundColor(Color.secondary)
                    .offset(y: 3)
            }
            .padding(.leading)
            .padding(.bottom, 30)
        }
    }
}

//struct NewsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsRow(article: ModelData().articles[0])
//        NewsRow()
//    }
//}
