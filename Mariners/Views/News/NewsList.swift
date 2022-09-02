//
//  NewsList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

//import Amplify
import SwiftUI

struct NewsList: View {
//    @StateObject var viewModel = ViewModel()
    @ObservedObject var viewModel = ViewModel()
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
//        List {
            ScrollView(showsIndicators: true) {
                ForEach(viewModel.articles) { article in
                    NavigationLink {
                        NewsDetail(article: article)
                    } label: {
                        NewsRow(article: article)
                    }
                }
            }
            .listRowInsets(EdgeInsets())
//        }
        .listStyle(.inset)
        .navigationTitle("News")
    }
    init() {
            viewModel.getData()
        }
}


struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
            .environmentObject(ModelData())
    }
}
