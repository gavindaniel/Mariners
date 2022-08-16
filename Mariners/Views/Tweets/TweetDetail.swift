//
//  TweetDetail.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/6/22.
//

import SwiftUI

struct TweetDetail: View {
    @EnvironmentObject var modelData: ModelData
    var tweet: Tweet
    
    var tweetIndex: Int {
        modelData.tweets.firstIndex(where: { $0.id == tweet.id })!
    }
    
    var body: some View {
        HStack(alignment: .top) {
            tweet.profileImage
                .resizable()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Text(tweet.name)
                        .fontWeight(.semibold)
                    Text("@\(tweet.username) • \(tweet.time)")
                        .foregroundColor(Color.secondary)
                }
//                .padding(.bottom, 1)
                .offset(y: -2)
                Text(tweet.body)
                    .fontWeight(.light)
            }
            .font(.caption)
        }
        .padding(10)
    }
}

struct TweetDetail_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        TweetDetail(tweet: modelData.tweets[0])
            .environmentObject(modelData)
    }
}
