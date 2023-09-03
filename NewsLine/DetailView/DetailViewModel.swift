//
//  DetailViewModel.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    
    @Published var detail: DetailModel?
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
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
            do {
                if let detail = try await repo.getDetails(id: id) {
                    DispatchQueue.main.async {
                        self.detail = detail
                        self.isLoading = false
                    }
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
}
