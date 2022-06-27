//
//  Groups.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 11.06.2022.
//

import UIKit
import RealmSwift


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
final class Groups: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photoGroup: String = ""

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photoGroup = "photo_100"
    }
}
