//
//  TwitterSmallView.swift
//  Twitter
//
//  Created by cole cabral on 2021-05-07.
//

import Foundation
import SwiftUI

struct TwitterSmallView : View {
    @Environment(\.colorScheme) var colorScheme
    let twitter: Twitter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 5) {
                VStack {
                    if let url = URL(string:twitter?.first?.user.profileImageURLHTTPS ?? "") {
                        let imageData = try? Data(contentsOf: url)
                        if let image = UIImage(data: imageData ?? Data()) {
                            Image(uiImage: image)
                                .resizable()
                                .interpolation(.high)
                                .frame(width: 37, height: 37)
                                .cornerRadius(18.5)
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: 40, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 3) {
                        Text(twitter?.first?.user.name ?? "")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .lineLimit(1)
                        if twitter?.first?.user.verified ?? false {
                            VerifiedShape()
                                //rgb(29, 161, 242)
                                .fill(colorScheme == .light ? Color(UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)) : Color.white)
                                .frame(width: 16, height: 16)
                        }
                    }
                    Text("@\(twitter?.first?.user.screenName ?? "")")
                        .font(.footnote)
                        .lineLimit(1)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:30, alignment: .leading)
            }
            HStack(alignment: .top) {
                Text(twitter?.first?.text ?? "")
                    .font(.footnote)
                    .lineLimit(nil)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity, alignment: .topLeading)
            }
            VStack {
                HStack {
                    HStack(spacing: 2){
                        Text(Image(systemName: "arrow.2.squarepath"))
                            .foregroundColor(Color.green)
                            .font(.caption)
                            .fontWeight(.bold)
                        Text("\(Int(twitter?.first?.retweetCount ?? 0).abbreviated)")
                            .font(.caption)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                    HStack(spacing: 2) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color.red)
                            .font(.caption)
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
