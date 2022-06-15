//
//  GroupsService.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.05.2022.
//

import UIKit


//MARK: - Request
/// ExtractingDataGroups
final class GroupsService {

    /// URLSeession
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()

    /// gettingDataGroups
    func gettingDataGroups(completion: @escaping ([Groups]) -> Void) {

        let params = [
            "extended": "1",
            "filter": "groups",
            "count": "10",
            "access_token": MySession.shared.token,
            "v": MySession.shared.currentApiVersion
        ]

        guard MySession.shared.token != "" else { return }

        let url: URL = .configureURL(
            token: MySession.shared.token,
            typeMethod: "/method/groups.get",
            params: params)

        session.dataTask(
            with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                // MARK: - conversion in JSON
                do {
                    let result = try JSONDecoder().decode(RequestGroup.self, from: data)
                    completion(result.response.items)
                    print(result)
                } catch {
                    print(error)
                }
            }.resume()
    }
}
