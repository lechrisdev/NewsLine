//
//  PostModel.swift
//  NewsLine
//
//  Created by Le Chris on 02.09.2023.
//

import Foundation

struct PostModel: Hashable {
    let id: Int
    let title: String
    let description: String
    let likes: Int
    let daysAgo: String
}


