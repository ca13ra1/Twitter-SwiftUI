//
//  TwitterMediumView.swift
//  Twitter
//
//  Created by cole cabral on 2021-05-07.
//

import Foundation
import SwiftUI

struct TwitterMediumView : View {
    let twitter: Twitter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 5) {
                VStack {
                    if let url = URL(string:twitter?.first?.user.profileImageURLHTTPS ?? ""),
                       let imageData = try? Data(contentsOf: url),
                       let image = UIImage(data:imageData) {
                        Image(uiImage:image)
                            .resizable()
                            .interpolation(.high)
                            .frame(width: 37, height: 37)
                            .cornerRadius(18.5)
                    }
                }
                .frame(minWidth: 0, maxWidth: 40, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 1) {
                    HStack(spacing: 4) {
                        Text(twitter?.first?.user.name ?? "")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .lineLimit(1)
                        if twitter?.first?.user.verified ?? false {
                            VerifiedShape()
                                .fill(Color("twitter"))
                                .frame(width: 16, height: 16)
                        }
                        Spacer()
                        Text(relativeDate(twitter?.first?.createdAt ?? ""))
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                    HStack {
                        Text("@\(twitter?.first?.user.screenName ?? "")")
                            .font(.footnote)
                            .lineLimit(1)
                        Spacer()
                        HStack {
                            HStack(spacing: 1){
                                Text(Image(systemName: "arrow.2.squarepath"))
                                    .foregroundColor(Color.green)
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                Text("\(Int(twitter?.first?.retweetCount ?? 0).abbreviated)")
                                    .font(.caption)
                            }
                            HStack(spacing: 1) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color.red)
                                    .font(.subheadline)
                                Text("\(Int(twitter?.first?.favoriteCount ?? 0).abbreviated)")
                                    .font(.caption)
                            }
                        }
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:40)
            HStack(alignment: .top) {
                Text(twitter?.first?.text ?? "")
                    .font(.footnote)
                    .lineLimit(nil)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity, alignment: .topLeading)
        }
        .padding(.all, 12)
    }
}
