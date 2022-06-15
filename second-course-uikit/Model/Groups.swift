//
//  Groups.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 11.06.2022.
//

import UIKit


//MARK: - Decodable
/// RequestGroup
struct RequestGroup: Decodable {
    let response: ResponseGroup
}


/// ResponseGroup
struct ResponseGroup: Decodable {
    let items: [Groups]
}


/// GroupsData
struct Groups: Decodable {
    let id: Int
    let name: String
    let photoGroup: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photoGroup = "photo_100"
    }
}







