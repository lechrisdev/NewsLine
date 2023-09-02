//
//  Repository.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import Foundation

protocol RepositoryProtocol {
    func getPosts() async -> [PostModel]
  //func getUsers(lastUserId: Int, firstLoad: Bool) async -> [UserModel]
//    func getUserRepositories(userName: String, page: Int, firstLoad: Bool) async -> [RepoModel]
}

class Repository: RepositoryProtocol {
    
    func getPosts() async -> [PostModel] {
        guard let response = await API.sendRequestData(request: Requests.getPosts)?
            .convertTo(PostsResponse.self)?.domain else { return [] }
        return response
    }
    
    
//    func getUsers(lastUserId: Int, firstLoad: Bool) async -> [UserModel] {
//        let localData = persistence.loadUsers()
//        if !localData.isEmpty && firstLoad {
//            return localData
//        } else {
//            guard let response = await API.sendRequestData(request: Requests.getUsers(lastUserId: lastUserId))?
//                .convertTo(UsersResponse.self)?.domain else { return [] }
//            persistence.saveUsers(users: response)
//            return response
//        }
//    }
//    
//    func getUserRepositories(userName: String, page: Int, firstLoad: Bool) async -> [RepoModel] {
//
//        let localData = persistence.loadUserRepositories(ownerName: userName)
//        if !localData.isEmpty && firstLoad {
//            return localData
//        } else {
//            guard let response = await API.sendRequestData(request: Requests.getUserRepositories(userName: userName,
//                                                                                                 page: page))?
//                .convertTo(ReposResponse.self)?.domain else { return [] }
//            persistence.saveUserRepositories(repos: response, userName: userName)
//            return response
//        }
//    }
}
