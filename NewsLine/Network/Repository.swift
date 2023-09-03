//
//  Repository.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import Foundation

protocol RepositoryProtocol {
    func getPosts() async throws -> [PostModel]
    func getDetails(id: Int) async throws -> DetailModel?
}

class Repository: RepositoryProtocol {
    
    func getPosts() async throws -> [PostModel] {
        guard let response = try await API.sendRequestData(request: Requests.getPosts)?
            .convertTo(PostsResponse.self)?.domain else { return [] }
        return response
    }
    
    func getDetails(id: Int) async throws -> DetailModel? {
        guard let response = try await API.sendRequestData(request: Requests.getDetail(postId: id))?
            .convertTo(DetailResponse.self)?.domain else { return nil }
        return response
    }
}
