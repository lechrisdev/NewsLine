//
//  Repository.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import Foundation

protocol RepositoryProtocol {
    func getPosts() async -> [PostModel]
    func getDetails(id: Int) async -> DetailModel?
}

class Repository: RepositoryProtocol {
    
    func getPosts() async -> [PostModel] {
        guard let response = await API.sendRequestData(request: Requests.getPosts)?
            .convertTo(PostsResponse.self)?.domain else { return [] }
        return response
    }
    
    func getDetails(id: Int) async -> DetailModel? {
        guard let response = await API.sendRequestData(request: Requests.getDetail(postId: id))?
            .convertTo(DetailResponse.self)?.domain else { return nil }
        return response
    }
}
