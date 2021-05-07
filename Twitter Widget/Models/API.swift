//
//  API.swift
//  Twitter
//
//  Created by cole cabral on 2021-05-07.
//

import Foundation

typealias Twitter = [TwitterEndpoint]?

struct TwitterEndpoint: Codable {
    let id = UUID()
    let createdAt: String
    let text: String
    let user: User
    let retweetCount, favoriteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case text
        case user
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
    }
}

struct User: Codable {
    let name, screenName: String
    let profileImageURLHTTPS: String
    let verified: Bool

    enum CodingKeys: String, CodingKey {
        case name
        case screenName = "screen_name"
        case profileImageURLHTTPS = "profile_image_url_https"
        case verified
    }
}
