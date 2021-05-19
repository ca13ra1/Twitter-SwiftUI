//
//  TwitterLargeView.swift
//  Twitter
//
//  Created by cole cabral on 2021-05-07.
//

import Foundation
import SwiftUI

struct TwitterLargeView : View {
    let twitter: Twitter
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(twitter ?? [], id:\.id) { twitter in
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 1) {
                        VStack {
                            if let url = URL(string:twitter.user.profileImageURLHTTPS),
                               let imageData = try? Data(contentsOf: url),
                               let image = UIImage(data:imageData) {
                                Image(uiImage:image)
                                    .resizable()
                                    .interpolation(.high)
                                    .frame(width: 34, height: 34)
                                    .cornerRadius(17)
                            }
                        }
                        .frame(minWidth: 0, maxWidth: 40, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 1) {
                            HStack(spacing: 4){
                                Text(twitter.user.name)
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                if twitter.user.verified {
                                    VerifiedShape()
                                        .fill(Color("twitter"))
                                        .frame(width: 16, height: 16)
                                }
                                Spacer()
                                Text(relativeDate(twitter.createdAt))
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                            HStack {
                                Text("@\(twitter.user.screenName)")
                                    .font(.footnote)
                                    .lineLimit(1)
                                Spacer()
                                HStack {
                                    HStack(spacing: 2){
                                        Text(Image(systemName: "arrow.2.squarepath"))
                                            .foregroundColor(Color.green)
                                            .font(.footnote)
                                            .fontWeight(.bold)
                                        Text("\(Int(twitter.retweetCount).abbreviated)")
                                            .font(.footnote)
                                    }
                                    HStack(spacing: 2) {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(Color.red)
                                            .font(.footnote)
                                        Text("\(Int(twitter.favoriteCount).abbreviated)")
                                            .font(.footnote)
                                    }
                                }
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:40)
                    HStack(alignment: .top) {
                        Text(twitter.text)
                            .font(.footnote)
                    }
                }
                .frame(minHeight: 0, maxHeight:.infinity)
                .padding(.all, 12)
            }
        }
    }
}
