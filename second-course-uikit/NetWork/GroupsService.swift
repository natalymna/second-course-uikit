//
//  GroupsService.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.05.2022.
//

import Foundation
import RealmSwift


//MARK: - Request
/// ExtractingDataGroups
final class GroupsService {

    /// URLSeession
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()

    /// gettingDataGroups
    func gettingDataGroups() {

        let params = [
            "extended": "1",
            "filter": "groups",
            "count": "10",
            "access_token": MySession.shared.token,
            "v": Constants.constants.currentApiVersion
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
//                print("GBG Data", String(data: data, encoding: .utf8))

                // MARK: - conversion in JSON
                do {
                    let result = try JSONDecoder().decode(RequestGroup.self, from: data).response.items
                    DispatchQueue.main.async {
                        self.saveGroups(result)
                    }
                } catch {
                    print(ServiceError.parseError)
                }
            }.resume()
    }
}


private extension GroupsService {
    func saveGroups(_ groups: [Groups]) {
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL ?? "")
            try realm.write {
                groups.forEach { realm.add($0, update: .modified) }
//                realm.add(groups, update: .modified)
            }
        } catch {
            print("DBG Groups", error)
        }
    }
}
