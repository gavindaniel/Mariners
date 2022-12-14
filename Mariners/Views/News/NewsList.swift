//
//  NewsList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

//import Amplify
import SwiftUI

struct NewsList: View {
    @ObservedObject var viewModel = NewsViewModel()
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
            } // scrollview end
            .listRowInsets(EdgeInsets())
//        } // list end
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
