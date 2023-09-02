//
//  MainViewModel.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    @Published var isLoading: Bool = false

    private let repo: RepositoryProtocol
    let router: Router
    
    init(repo: RepositoryProtocol, router: Router) {
        self.repo = repo
        self.router = router
        getPosts()
    }
    
    func getPosts() {
        isLoading = true
        Task {
            let posts = await repo.getPosts()
            DispatchQueue.main.async {
                self.posts = posts
                self.isLoading = false
            }
        }
    }
}
