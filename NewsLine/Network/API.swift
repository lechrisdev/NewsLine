//
//  API.swift
//  NewsLine
//
//  Created by Le Chris on 02.09.2023.
//

import Foundation
import Alamofire

class API {
    static func sendRequestData(request: EndPoint) async -> Data? {
        do {
            
            return try await AF.request(request.path,
                                        method: request.httpMethod,
                                        parameters: request.parameters,
                                        encoding: URLEncoding.default,
                                        headers: nil)
                    .validate(statusCode: 200..<300)
                    .serializingData()
                    .value
        } catch {
            print("Error sending request: \(error)")
            return nil
        }
    }
}

protocol EndPoint {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters? { get }
}

enum Requests: EndPoint {
    case getPosts
    case getUsers(lastUserId: Int)
    //case getDetail
    case getUserRepositories(userName: String, page: Int)

    var path: String {
        switch self {
        case .getPosts:
            return "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
        case .getUsers:
            return "https://api.github.com/users"
        case let .getUserRepositories(userName, _):
            return "https://api.github.com/users/\(userName)/repos"
        }
    }

    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .getPosts, .getUsers, .getUserRepositories:
            return .get
        }
    }

    var parameters: Parameters? {
        switch self {
        case .getPosts:
            return nil
        case let .getUsers(lastUserId):
            let parameters: [String: Encodable] = [
                "per_page": 10,
                "since": lastUserId
            ]
            return parameters
        case let .getUserRepositories(_ , page):
            let parameters: [String: Encodable] = [
                "per_page": 10,
                "page": page
            ]
            return parameters
        }
    }
}
