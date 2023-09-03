//
//  AppAssembly.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import Foundation
import Swinject

class AppAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: - Managers
        
        container.register(Router.self, factory: { _ in
            Router()
        })
        .inObjectScope(.container)
        
        container.register(Repository.self) { container in
            Repository()
        }
        .inObjectScope(.container)
        
        // MARK: - ViewModels

        container.register(MainViewModel.self, factory: { container in
            MainViewModel(repo: container.resolve(Repository.self)!,
                          router: container.resolve(Router.self)!
            )
        })
        
        container.register(DetailViewModel.self, factory: { container, postId in
            DetailViewModel(repo: container.resolve(Repository.self)!,
                            router: container.resolve(Router.self)!,
                            postId: postId)
        })
    }
}
