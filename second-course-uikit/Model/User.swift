//
//  User.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 02.06.2022.
//

import UIKit
import RealmSwift

//MARK: - Decodable
/// RequestFriend
struct RequestFriend: Decodable {
    let response: ResponseFriend
}

/// ResponseFriend
struct ResponseFriend: Decodable {
    let items: [User]
}

/// FriendData
final class User: Object, Decodable {
    @objc dynamic var id = 0
    @objc dynamic var birthdayDate = ""
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var avatar = ""

    enum CodingKeys: String, CodingKey {
        case id
        case birthdayDate = "bdate"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_100"
    }
}


////MARK: - Decodable
///// FriendData
//struct User: Decodable {
//    let id: Int
//    let birthdayDate: String?
//    let firstName: String
//    let lastName: String
//    let avatar: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case birthdayDate = "bdate"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case avatar = "photo_100"
//    }
//}
//
///// ResponseFriend
//struct ResponseFriend: Decodable {
//    let items: [User]
//}
//
///// RequestFriend
//struct RequestFriend: Decodable {
//    let response: ResponseFriend
//}
