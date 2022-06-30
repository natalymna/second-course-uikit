//
//  PhotoService.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.05.2022.
//

import Foundation
import RealmSwift

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
    @available(iOS 15.0, *)
    func gettingDataAllPhotos(for id: String, completion: @escaping ([Item]) -> Void) async {

        let params = [
            "owner_id": id,
            "extended": "1",
            "count": "40",
            "access_token": MySession.shared.token,
            "v": Constants.constants.currentApiVersion
        ]

        guard MySession.shared.token != "" else { return }

        let url: URL = .configureURL(
            token: MySession.shared.token,
            typeMethod: "/method/photos.getAll",
            params: params)
        print("DBG", url)

        // MARK: - conversion in JSON
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let result = try decoder.decode(RequestPhoto.self, from: data).response.items
            self.savePhoto(photos: result)
            completion(result)
        } catch {
            print(error)
        }
    }
}

// MARK: - Private extension
private extension PhotoService {
    func savePhoto(photos: [Item]) {
        if let realm = try? Realm() {
            print("DBG", realm.configuration.fileURL ?? "")
            do {
                try realm.write({
                    realm.add(photos, update: .modified)
                })
            } catch {
                print("error")
            }
        }
    }
}

