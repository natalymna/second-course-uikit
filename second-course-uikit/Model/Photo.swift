//
//  Photo.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 06.06.2022.
//

import UIKit

struct RequestPhoto: Decodable {
    let response: ResponsePhoto
}

struct ResponsePhoto: Decodable {
    var items: [Item]
}

struct Item: Codable {
    let albumID: Int
    let date: Int
    let id: Int
    var ownerID: Int
    let hasTags: Bool
    var sizes: [Size]
    let text: String
    var likes: Likes?
    var reposts: Reposts

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date
        case id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case sizes
        case text
        case likes
        case reposts
    }
}

struct Likes: Codable {
    var likesCounter: Int?
    var isLiked: Int?

    enum LikeCount: String, CodingKey {
        case likesCounter = "count"
        case isLiked = "user_likes"
    }
}

struct Reposts: Codable {
        var count: Int

    enum RepostsCount: CodingKey {
        case count
    }
}

struct Size: Codable {
    let height: Int
    var url: String
    let type: EnumType
    let width: Int
}

// енум с типами фото
enum EnumType: String, Codable {
    case m = "m"
    case o = "o"
    case p = "p"
    case q = "q"
    case r = "r"
    case s = "s"
    case w = "w"
    case x = "x"
    case y = "y"
    case z = "z"
}


//struct RequestPhoto: Decodable {
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
