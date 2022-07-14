//
//  UserService.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.05.2022.
//

import Foundation
import RealmSwift

enum ServiceError: Error {
    case serviceIsNotAvailable
    case decodingError
    case urlNotConfigure
}


//MARK: - Request
/// ExtractingDataFriends
final class UserService {

    /// URLSeession
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()

    /// gettingDataFriends
    func gettingDataFriends(completion: @escaping ([User]) -> Void) {

        let params = [
            "order": "hints",
            "count": "10",
            "fields": "first_name, last_name, bdate, city, photo_100",
            "access_token": MySession.shared.token,
            "v": Constants.constants.currentApiVersion
        ]

        guard MySession.shared.token != "" else { return }

        let url: URL = .configureURL(
            token: MySession.shared.token,
            typeMethod: "/method/friends.get",
            params: params)

        session.dataTask(
            with: url) { data, _, error in
                guard let data = data, error == nil else { return }

                // MARK: - conversion in JSON
                do {
                    let result = try JSONDecoder().decode(RequestFriend.self, from: data)
                    completion(result.response.items)
                } catch {
                    print(error)
                }
            }.resume()
        }
    }

//MARK: - Конструктор
//        var urlConstructor = URLComponents()
//        urlConstructor.scheme = MySession.shared.scheme
//        urlConstructor.host = MySession.shared.host
//        urlConstructor.path = "/method/friends.get"
//        urlConstructor.queryItems = [
//            URLQueryItem(name: "order", value: "hints"),
//            URLQueryItem(name: "count", value: "10"),
//            URLQueryItem(name: "fields", value: "first_name, last_name, bdate, city, photo_100"),
//            URLQueryItem(name: "access_token", value: MySession.shared.token),
//            URLQueryItem(name: "v", value: MySession.shared.currentApiVersion)
//        ]


//MARK: - второй вариант реализации (оставлю здесь для себя)
//        let urlString = "https://api.vk.com/method/friends.get?order=hints&count=10&fields=first_name,last_name,bdate,city, photo_100&access_token=\(MySession.shared.token)&v=\(MySession.shared.currentApiVersion)"
//        guard let url = URL(string: urlString) else { return }
//
//        let session = URLSession(configuration: .default)
//
//        let task = session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            guard let dataString = String(data: data, encoding: .utf8) else { return }
//            print(dataString)
//
//            guard let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) else { return }
//
//            print(json)
//        }
//        task.resume()
