//
//  HomeView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/5/22.
//

import SwiftUI
//import Amplify

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingSettings = false
//    @StateObject var viewModel = ViewModel()
//    @State private var games = [GameElement]()
    
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    ScrollView(showsIndicators: true) {
                        GameFeatured(isLoading: false, game: ModelData().scores.league.games[0].game)
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
//            .refreshable {
//                await loadData()
//            }
//            .task {
//                await loadData()
//            }
        }
//        .onAppear(perform: viewModel.getArticles)
    }
    
//    func loadData() async {
//        guard let url = URL(string: "https://api.sportradar.us/mlb/trial/v7/en/games/2022/08/19/boxscore.json?api_key=wnfa3bdarch3hxhh8jv64znu") else {
//            print("Invalid URL")
//            return
//        }
//
//        do {
//            let (jsonData, _) = try await URLSession.shared.data(from: url)
//
//            if let box_scores = try? JSONDecoder().decode(DailyBoxscore.self, from: jsonData) {
//                games = box_scores.league.games
//                print("JSON decoded.")
//            }
//        } catch {
//            print("Invalid data")
//        }
//    }
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
