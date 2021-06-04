//
//  TwitterSmallView.swift
//  Twitter
//
//  Created by cole cabral on 2021-05-07.
//

import Foundation
import SwiftUI

struct TwitterSmallView : View {
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
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 3) {
                        Text(twitter?.first?.user.name ?? "")
                            .font(.caption)
                            .fontWeight(.bold)
                            .lineLimit(1)
                        if twitter?.first?.user.verified ?? false {
                            VerifiedShape()
                                .fill(Color("twitter"))
                                .frame(width: 16, height: 16)
                        }
                    }
                    Text("@\(twitter?.first?.user.screenName ?? "")")
                        .font(.caption)
                        .lineLimit(1)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:30, alignment: .leading)
            }
            HStack(alignment: .top) {
                Text(twitter?.first?.text ?? "")
                    .font(.caption)
                    .lineLimit(nil)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity, alignment: .topLeading)
            }
            VStack {
                HStack {
                    HStack(spacing: 1){
                        Text(Image(systemName: "arrow.2.squarepath"))
                            .foregroundColor(Color.green)
                            .font(.footnote)
                            .fontWeight(.bold)
                        Text("\(Int(twitter?.first?.retweetCount ?? 0).abbreviated)")
                            .font(.caption)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                    HStack(spacing: 1) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color.red)
                            .font(.subheadline)
                        Text("\(Int(twitter?.first?.favoriteCount ?? 0).abbreviated)")
                            .font(.caption)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:20)
            }
        }
        .padding(.all, 10)
    }
}
