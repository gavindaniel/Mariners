//
//  TweetList.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import SwiftUI

struct TweetList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        List(modelData.tweets, id: \.id) { tweet in
            TweetDetail(tweet: tweet)
        }
        .navigationTitle("Tweets")
    }
}

struct TweetList_Previews: PreviewProvider {
    static var previews: some View {
        TweetList()
            .environmentObject(ModelData())
    }
}
