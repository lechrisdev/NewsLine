//
//  DetailResponse.swift
//  NewsLine
//
//  Created by Le Chris on 03.09.2023.
//

import Foundation

// MARK: - DetailResponse
struct DetailResponse: Codable {
    let post: PostDetail
}

// MARK: - Post
struct PostDetail: Codable {
    let postID, timeshamp: Int
    let title, text: String
    let postImage: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title, text, postImage
        case likesCount = "likes_count"
    }
}

extension DetailResponse {
    var domain: DetailModel {
        let formattedDate = String.formattedDateString(fromTimestamp: Double(post.timeshamp))
        return DetailModel(url:     post.postImage,
                           title:   post.title,
                           post:    post.text,
                           likes:   post.likesCount,
                           date:    formattedDate)
    }
}
