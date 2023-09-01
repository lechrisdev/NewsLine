//
//  Router.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI
import UIKit
import Swinject

class Router {
    private var navigationController: UINavigationController?
    
    func configureNavigationController() {
        if navigationController == nil {
            let vm = Container.shared.resolve(MainViewModel.self)!
            let vc = UIHostingController(rootView: MainView(viewModel: vm))
            navigationController = UINavigationController(rootViewController: vc)
            navigationController?.title = ""
            
            UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .last { $0.isKeyWindow }?.rootViewController = navigationController
        }
    }
    
    func showDetailViewScreen() { //(user: String, avatarURL: String) {
        let vm = Container.shared.resolve(DetailViewModel.self)!//, arguments: user, avatarURL)!
        let vc = UIHostingController(rootView: DetailView(viewModel: vm))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
