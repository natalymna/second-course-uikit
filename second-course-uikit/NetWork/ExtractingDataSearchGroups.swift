//
//  ExtractingDataSearchGroups.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.05.2022.
//

import UIKit


/// ExtractingDataSearchGroups
final class ExtractingDataSearchGroups {

    /// gettingDataSearchGroups
    /// - Parameter searchText: search text in global search groups
    func gettingDataSearchGroups(searchText: String) {

        guard MySession.shared.token != "" else { return }

        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        var urlConstructor = URLComponents()
        urlConstructor.scheme = MySession.shared.scheme
        urlConstructor.host = MySession.shared.host
        urlConstructor.path = "/method/groups.search"
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: searchText),
            URLQueryItem(name: "type", value: "group"),
            URLQueryItem(name: "count", value: "20"),
            URLQueryItem(name: "access_token", value: MySession.shared.token),
            URLQueryItem(name: "v", value: MySession.shared.currentApiVersion)
        ]

        guard let urlTask = urlConstructor.url else { return }

        let task = session.dataTask(with: urlTask) { data, response, error in
            guard let data = data else { return }

            // MARK: - conversion in JSON
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)

                print(json)
            } catch {
                print(error)
            }

        }

        task.resume()

    }
}

