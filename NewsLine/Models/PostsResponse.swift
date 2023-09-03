//
//  PostsResponse.swift
//  NewsLine
//
//  Created by Le Chris on 02.09.2023.
//

import Foundation

// MARK: - PostsResponse
struct PostsResponse: Codable {
    let posts: [Post]
}

// MARK: - Post
struct Post: Codable {
    let postID, timeshamp: Int
    let title, previewText: String
    let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}

extension PostsResponse {
    var domain: [PostModel] {
        posts.map {
            let relativeDate = String.relativeDateString(fromTimestamp: Double($0.timeshamp))
            return PostModel(id: $0.postID,
                             title: $0.title,
                             description: $0.previewText,
                             likes: $0.likesCount,
                             daysAgo: relativeDate,
                             unixTime: $0.timeshamp)
        }
    }
}
