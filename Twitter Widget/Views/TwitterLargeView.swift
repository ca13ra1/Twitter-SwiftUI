//
//  TwitterLargeView.swift
//  Twitter
//
//  Created by cole cabral on 2021-05-07.
//

import Foundation
import SwiftUI

struct TwitterLargeView : View {
    @Environment(\.colorScheme) var colorScheme
    let twitter: Twitter
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(twitter ?? [], id:\.id) { twitter in
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 1) {
                        VStack {
                            if let url = URL(string:twitter.user.profileImageURLHTTPS) {
                                let imageData = try? Data(contentsOf: url)
                                if let image = UIImage(data: imageData ?? Data()) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .interpolation(.high)
                                        .frame(width: 34, height: 34)
                                        .cornerRadius(17)
                                }
                            }
                        }
                        .frame(minWidth: 0, maxWidth: 40, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 1) {
                            HStack(spacing: 4){
                                Text(twitter.user.name)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                if twitter.user.verified {
                                    VerifiedShape()
                                        //rgb(29, 161, 242)
                                        .fill(colorScheme == .light ? Color(UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)) : Color.white)
                                        .frame(width: 16, height: 16)
                                }
                                Spacer()
                                Text(relativeDate(twitter.createdAt))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                            HStack {
                                Text("@\(twitter.user.screenName)")
                                    .font(.caption)
                                    .lineLimit(1)
                                Spacer()
                                HStack {
                                    HStack(spacing: 2){
                                        Text(Image(systemName: "arrow.2.squarepath"))
                                            .foregroundColor(Color.green)
                                            .font(.caption)
                                            .fontWeight(.bold)
                                        Text("\(Int(twitter.retweetCount).abbreviated)")
                                            .font(.caption)
                                    }
                                    HStack(spacing: 2) {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(Color.red)
                                            .font(.caption)
                                        Text("\(Int(twitter.favoriteCount).abbreviated)")
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:40)
                    HStack(alignment: .top) {
                        Text(twitter.text)
                            .font(.caption)
                    }
                }
                .frame(minHeight: 0, maxHeight:.infinity)
                .padding(.all, 12)
            }
        }
    }
}
