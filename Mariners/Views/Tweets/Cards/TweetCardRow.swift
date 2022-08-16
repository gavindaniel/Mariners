//
//  TweetCardRow.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct TweetCardRow: View {
    var tweets: [Tweet]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("Tweets")
                    .font(.headline)

                Spacer()
                
                NavigationLink {
                    TweetList()
                } label: {
                    Text("See All")
                        .foregroundColor(Color.blue)
                        .font(.caption)
                }
            }
            .padding(.top, 10)
            
            Divider()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(tweets) { tweet in
                        NavigationLink {
                            TweetDetail(tweet: tweet)
                        } label: {
                            TweetCard(tweet: tweet)
                        }
                    }
                }
                .padding(.leading, 5)
                .padding(.top, 25)
                .padding(.bottom, 25)
            }
            .frame(height: 200)
        }
    }
}

struct TweetCardRow_Previews: PreviewProvider {
    static var tweets = ModelData().tweets
    
    static var previews: some View {
        TweetCardRow(tweets: Array(tweets.prefix(3)))
    }
}
