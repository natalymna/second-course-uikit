//
//  GroupsSearch.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 11.06.2022.
//

import UIKit
import RealmSwift


//MARK: - Decodable
/// RequestSearchGroup
struct RequestSearchGroup: Decodable {
    let response: ResponseSearchGroup
}

/// ResponseSearchGroup
struct ResponseSearchGroup: Decodable {
    let items: [SearchGroups]
}


/// SearchGroupsData
final class SearchGroups: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photoSearchGroup: String = ""

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photoSearchGroup = "photo_100"
    }
}
