//
//  Session.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 10.05.2022.
//

import Foundation

// MARK: - Session for getting token and userID
/// MySession
final class MySession {
    static var shared = MySession()
    private init() {}

    //MARK: - properties
    var token: String = ""
    var userID: Int = 0
    let currentApiVersion = "5.131"
    let scheme = "https"
    let host = "api.vk.com"
}
