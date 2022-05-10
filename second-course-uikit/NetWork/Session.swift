//
//  Session.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 10.05.2022.
//

import Foundation


struct Session {
    static let shared = Session()
    private init() {}

    let token: String = ""
    let userID: Int = 0
}
