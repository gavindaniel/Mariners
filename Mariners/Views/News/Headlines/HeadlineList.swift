//
//  HeadlineList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI
//import Amplify
import Combine

struct HeadlineList: View {
    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Text("Headlines")
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
                ForEach(viewModel.articles) { article in
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
}

extension HeadlineList {
    class ViewModel: ObservableObject {
        @Published var articles = [Article]()
        
//        func getArticles() {
//            Amplify.DataStore.query(Article.self) { result in
//                do {
//                    let articles = try result.get()
////                    print(articles)
//                    DispatchQueue.main.async { [weak self] in
//                        self?.articles = articles
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//        }
    }
}


struct HeadlineList_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineList()
            .environmentObject(ModelData())
    }
}
