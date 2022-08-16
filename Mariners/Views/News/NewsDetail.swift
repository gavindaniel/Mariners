//
//  NewsDetail.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import SwiftUI
import Amplify

struct NewsDetail: View {
    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var sessionManager: SessionManager
    
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
//                article.image
                Image("ty-france")
                    .resizable()
                    .scaledToFill()
//                    .frame(height: 150)
                    .clipped()
                VStack(alignment: .leading) {
                    Text(article.title) // ?? "Title"
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text((article.date ?? "Date") + " • " + (article.source ?? "Source"))
                        .font(.footnote)
                        .foregroundColor(Color.secondary)
                        .offset(y: 3)
//                    Text(.init(article.body ?? "Body"))
                    Text(try! AttributedString(markdown: article.body ?? "Body"))
                        .font(.callout)
                        .padding(.top)
                        .lineSpacing(5)
                }
                .padding()
            }
//            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


//struct NewsDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsDetail()
//    }
//}
