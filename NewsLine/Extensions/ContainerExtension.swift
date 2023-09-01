//
//  ContainerExtension.swift
//  NewsLine
//
//  Created by Le Chris on 01.09.2023.
//

import Foundation
import Swinject

extension Container {
    static var shared: Container = {
        let container = Container()
        return container
    }()
}
