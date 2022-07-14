//
//  Photo.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 06.06.2022.
//

import UIKit
import RealmSwift

/// RequestPhoto
struct RequestPhoto: Decodable {
    let response: ResponsePhoto
}

/// ResponsePhoto
struct ResponsePhoto: Decodable {
    let items: [Item]
}

/// Item
final class Item: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var ownerID: Int = 0
    var sizes = List<Size>()
    @objc dynamic var likes: Likes?


    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
        case likes
    }

    override class func primaryKey() -> String? {
        return "id"
    }
}

/// Likes
final class Likes: Object, Decodable {
    @objc dynamic var likesCounter: Int = 0
    @objc dynamic var isLiked: Int = 0

    enum LikeCount: String, CodingKey {
        case likesCounter = "count"
        case isLiked = "user_likes"
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: LikeCount.self)
        self.likesCounter = try values.decodeIfPresent(Int.self, forKey: .likesCounter) ?? 0
        self.isLiked = try values.decodeIfPresent(Int.self, forKey: .isLiked) ?? 0
    }
}

/// Size
final class Size: Object, Decodable {
    @objc dynamic var height: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var width: Int = 0
}


// енум с типами фото
//enum EnumType: String, Codable {
//    case m = "m"
//    case o = "o"
//    case p = "p"
//    case q = "q"
//    case r = "r"
//    case s = "s"
//    case w = "w"
//    case x = "x"
//    case y = "y"
//    case z = "z"
//}



//structruct RequestPhoto: Decodable {
//    let response: ResponsePhoto
//}
//
//struct ResponsePhoto: Decodable {
//    var items: [PhotoData]
//}
//
//struct PhotoData: Decodable {
//    var likes: Likes
//    var ownerID: Int
//    var sizes: [SizesPhoto]
//
//    enum CodingKeys: String, CodingKey {
//        case likes
//        case ownerID = "owner_id"
//        case sizes
//    }
//
//}
//
//struct Likes: Decodable {
//    var likesCounter: Int
//    var isLiked: Int
//
//    enum CodingKeysLikes: String, CodingKey {
//        case likesCounter = "count"
//        case isLiked = "user_likes"
//
//    }
//}
//
//struct SizesPhoto: Decodable {
//    let type: String
//    let imageName: String
//
//    enum CodingKeysSizesPhoto: String, CodingKey {
//        case imageName = "url"
//
//    }
//}
