//
//  MainViewModel.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    private let repo: RepositoryProtocol
    let router: Router
    
    init(repo: RepositoryProtocol, router: Router) {
        self.repo = repo
        self.router = router
//        Task {
//            users = await repo.getUsers(lastUserId: 0, firstLoad: true)
//        }
    }
}
