//
//  GlobalSearchService.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.05.2022.
//

import UIKit

//MARK: - Request
/// ExtractingDataSearchGroups
final class GlobalSearchService {

    /// URLSeession
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()

    /// gettingDataSearchGroups
    /// - Parameter searchText: search text in global search groups
    func gettingDataSearchGroups(searchText: String, completion: @escaping ([SearchGroups]) -> Void) {

        let params = [
            "q": searchText,
            "type": "group",
            "count": "20",
            "access_token": MySession.shared.token,
            "v": MySession.shared.currentApiVersion
        ]

        guard MySession.shared.token != "" else { return }

        let url: URL = .configureURL(
            token: MySession.shared.token,
            typeMethod: "/method/groups.search",
            params: params)

        session.dataTask(
            with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                // MARK: - conversion in JSON
                do {
                    let result = try JSONDecoder().decode(RequestSearchGroup.self, from: data)
                    completion(result.response.items)
                } catch {
                    print(error)
                }
        }.resume()
    }
}

