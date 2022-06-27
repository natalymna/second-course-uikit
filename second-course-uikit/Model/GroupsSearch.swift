//
//  GroupsSearch.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 11.06.2022.
//

import UIKit


//MARK: - Decodable
/// SearchGroupsData
struct SearchGroups: Decodable {
    let id: Int
    let name: String
    let photoSearchGroup: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photoSearchGroup = "photo_100"
    }
}

/// ResponseSearchGroup
struct ResponseSearchGroup: Decodable {
    let items: [SearchGroups]
}


/// RequestSearchGroup
struct RequestSearchGroup: Decodable {
    let response: ResponseSearchGroup
}
