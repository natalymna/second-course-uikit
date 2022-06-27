//
//  PhotoService.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.05.2022.
//

import UIKit

//MARK: - Request
/// ExtractingDataAllPhotos
final class PhotoService {

    /// URLSeession
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()

    /// gettingDataAllPhotos
    /// - Parameter id: id of the owner of the photo in VK
    func gettingDataAllPhotos(for id: String, completion: @escaping ([Item]) -> Void) {

        let params = [
            "owner_id": id,
            "extended": "1",
            "count": "10",
            "access_token": MySession.shared.token,
            "v": MySession.shared.currentApiVersion
        ]

        guard MySession.shared.token != "" else { return }

        let url: URL = .configureURL(
            token: MySession.shared.token,
            typeMethod: "/method/photos.getAll",
            params: params)

        session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            // MARK: - conversion in JSON
            do {
                let result = try JSONDecoder().decode(RequestPhoto.self, from: data)
                completion(result.response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
}

