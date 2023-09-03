//
//  NewsLineTests.swift
//  NewsLineTests
//
//  Created by Le Chris on 01.09.2023.
//

import XCTest
@testable import NewsLine

final class NewsLineTests: XCTestCase {

    func testSortingByRating() throws {
        let viewModel = MainViewModel(repo: Repository(),
                                      router: Router())
        let posts: [PostModel] = [
            PostModel(id: 101, title: "title1", description: "description1", likes: 100, daysAgo: String(3), unixTime: 1234567),
            PostModel(id: 102, title: "title2", description: "description2", likes: 10, daysAgo: String(5), unixTime: 2345678),
            PostModel(id: 103, title: "title3", description: "description3", likes: 1000, daysAgo: String(8), unixTime: 3456789)
        ]
        
        viewModel.posts = posts
        
        XCTAssertTrue(viewModel.posts[0].likes == 100)
        viewModel.sort(by: .rating)
        XCTAssertTrue(viewModel.posts[0].likes == 1000)
    }
    
    func testSortingByDate() throws {
        let viewModel = MainViewModel(repo: Repository(),
                                      router: Router())
        let posts: [PostModel] = [
            PostModel(id: 101, title: "title1", description: "description1", likes: 100, daysAgo: String(3), unixTime: 1234567),
            PostModel(id: 102, title: "title2", description: "description2", likes: 10, daysAgo: String(5), unixTime: 2345678),
            PostModel(id: 103, title: "title3", description: "description3", likes: 1000, daysAgo: String(8), unixTime: 3456789)
        ]
        
        viewModel.posts = posts
        
        XCTAssertTrue(viewModel.posts[0].daysAgo == "3")
        viewModel.sort(by: .date)
        XCTAssertTrue(viewModel.posts[0].daysAgo == "8")
    }

}
