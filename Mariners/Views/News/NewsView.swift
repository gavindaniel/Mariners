//
//  NewsView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

//import Amplify
import SwiftUI

struct NewsView: View {
//    @EnvironmentObject var modelData: ModelData
    @ObservedObject var viewModel = ViewModel()
    
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


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(ModelData())
    }
}
