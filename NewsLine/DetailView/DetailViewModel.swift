//
//  DetailViewModel.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var detail: DetailModel?
    @Published var isLoading: Bool = false
    
    private let repo: RepositoryProtocol
    let router: Router
    let postId: Int
    
    init(repo: RepositoryProtocol, router: Router, postId: Int) {
        self.repo = repo
        self.router = router
        self.postId = postId
        getDetail(id: postId)
    }
    
    func getDetail(id: Int) {
        isLoading = true
        Task {
            if let detail = await repo.getDetails(id: id) {
                DispatchQueue.main.async {
                    self.detail = detail
                    self.isLoading = false
                }
            }
        }
    }
}
