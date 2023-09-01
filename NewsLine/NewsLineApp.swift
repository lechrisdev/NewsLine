//
//  NewsLineApp.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import SwiftUI
import Swinject

@main
struct NewsLineApp: App {
    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    _ = Assembler([AppAssembly()],
                                  container: Container.shared)
                    Container.shared.resolve(Router.self)!.configureNavigationController()
                }
        }
    }
}
