//
//  HomeView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import SwiftUI
import Amplify

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingSettings = false
//    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
//        VStack {
//            Image("text-logo")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100)
//
//            Spacer()
//        }
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    ScrollView(showsIndicators: true) {
                        GameFeatured(game: modelData.games[0])
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.top, 10)
                
                VStack(alignment: .leading) {
                    ScrollView(showsIndicators: true) {
                        HeadlineList()
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.top, 50)
                
                VStack(alignment: .leading) {
                    ScrollView(showsIndicators: true) {
                        TweetCardRow(tweets: modelData.tweets)
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.top, 50)
                .padding(.bottom, 25)
            }
            .listStyle(.inset)
            .navigationTitle("Home")
            .toolbar {
                Button {
                    showingSettings.toggle()
                } label: {
                    Label("User Settings", systemImage: "gearshape.fill")
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsHost()
                    .environmentObject(modelData)
            }
        }
//        .onAppear(perform: viewModel.getArticles)
    }
}

//extension HomeView {
//    class ViewModel: ObservableObject {
//        @Published var articles = [Article]()
//
//        func getArticles() {
//            Amplify.DataStore.query(Article.self) { result in
//                do {
//                    let articles = try result.get()
//                    DispatchQueue.main.async { [weak self] in
//                        self?.articles = articles
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//        }
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModelData())
    }
}
