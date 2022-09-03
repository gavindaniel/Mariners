//
//  NewsDetail.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

//import Amplify
import SwiftUI

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
                    Text(article.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text((article.date) + " • " + (article.source))
                        .font(.footnote)
                        .foregroundColor(Color.secondary)
                        .offset(y: 3)
                    Text(try! AttributedString(markdown: article.body))
                        .font(.callout)
                        .padding(.top)
                        .opacity(0.85)
                        .lineSpacing(10)
                }
                .padding()
            }
//            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail(article: ModelData().articles[0])
    }
}
