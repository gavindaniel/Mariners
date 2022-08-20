//
//  NewsList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import Amplify
import SwiftUI

struct NewsList: View {
    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
//        List {
//            VStack(alignment: .leading) {
                ScrollView(showsIndicators: true) {
                    ForEach(modelData.articles) { article in
                        NavigationLink {
                            NewsDetail(article: article)
                        } label: {
                            NewsRow(article: article)
                        }
                    }
                }
//            }
            .listRowInsets(EdgeInsets())
//        }
        .listStyle(.inset)
        .navigationTitle("News")
//        .onAppear(perform: viewModel.getArticles)
    }
}

extension NewsList {
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

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
            .environmentObject(ModelData())
    }
}
