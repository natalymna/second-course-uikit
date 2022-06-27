//
//  Extension+URL.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 08.06.2022.
//

import Foundation

extension URL {
    static func configureURL(token: String,
                             typeMethod: String,
                             params: [String: String]) -> URL {

        var queryItems: [URLQueryItem] = []
        params.forEach { name, value in
            queryItems.append(URLQueryItem(name: name, value: value))
        }

        queryItems.append(.init(name: "access_token", value: token))

        var components = URLComponents()
        components.scheme = MySession.shared.scheme
        components.host = MySession.shared.host
        components.path = typeMethod
        components.queryItems = queryItems

        guard let url = components.url else { fatalError("") }

        return url
    }
}
