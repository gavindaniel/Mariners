//
//  HeadlineList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

//import Amplify
import Combine
import SwiftUI

struct HeadlineList: View {
    @ObservedObject var viewModel = NewsViewModel()
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Text("News")
                    .font(.title3)
                    .fontWeight(.semibold)

                Spacer()
                
                NavigationLink {
                    NewsList()
                } label: {
                    Text("See All")
                        .foregroundColor(Color.blue)
                        .font(.callout)
                }
            }
            .padding(.top, 10)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 0) {
                //  modelData
                ForEach(viewModel.articles.prefix(3)) { article in
                    NavigationLink {
                        NewsDetail(article: article)
                    } label: {
                        HeadlineRow(article: article)
                    }
                    Divider()
                }
            }
        }
//        .onAppear(perform: viewModel.getArticles)
    }
    init() {
        viewModel.getData()
    }
}


struct HeadlineList_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineList()
            .environmentObject(ModelData())
    }
}
