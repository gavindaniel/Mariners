//
//  TweetCard.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/7/22.
//

import SwiftUI

struct TweetCard: View {
    var tweet: Tweet
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: .secondary, radius: 1)
            
            HStack(alignment: .top) {
                tweet.profileImage
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    HStack {
                        Text(tweet.name)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        Text("@\(tweet.username) • \(tweet.time)")
                            .foregroundColor(Color.secondary)
                    }
    //                .padding(.bottom, 1)
                    .offset(y: -2)
                    Text(tweet.body)
                        .fontWeight(.light)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
    //                    .fixedSize(horizontal: false, vertical: true)
                }
                .font(.caption)
            }
            .frame(width: 300, height: 150)
            .padding(10)
        }
        .frame(width: 340, height: 150)
    }
}

struct TweetCard_Previews: PreviewProvider {
    static var previews: some View {
        TweetCard(tweet: ModelData().tweets[0])
    }
}
