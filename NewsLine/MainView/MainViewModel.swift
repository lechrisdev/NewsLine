//
//  MainViewModel.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    enum SortingBy {
        case date
        case rating
    }
    
    @Published var posts: [PostModel] = []
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false

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
            do {
                let posts = try await repo.getPosts()
                DispatchQueue.main.async {
                    self.posts = posts
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    switch error.asAFError?.responseCode {
                    case 401:
                        self.errorMessage = "Site doesn't work"
                    case nil:
                        self.errorMessage = "Error connection"
                    case .some(_):
                        self.errorMessage = error.localizedDescription
                    }
                    withAnimation(Animation.spring(response: 0.8, dampingFraction: 0.3, blendDuration: 0.6)) {
                        self.showError = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        self.showError = false
                    }
                }
            }
        }
    }
    
    func sort(by: SortingBy) {
        withAnimation {
            switch by {
            case .date:
                posts.sort(by: { $0.unixTime > $1.unixTime })
            case .rating:
                posts.sort(by: { $0.likes > $1.likes })
            }
        }
    }
    
}
