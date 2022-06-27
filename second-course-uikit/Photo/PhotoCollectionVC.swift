//
//  PhotoCollectionVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit

struct PhotoTestData {
    let name: String
    var isLiked: Bool = false
}

/// PhotoCollectionVC
final class PhotoCollectionVC: UICollectionViewController {

    //MARK: - properties

    private let getAllPhotos = PhotoService()

    /// Идентификатор пользователя
    var userID: String = ""

    /// Массив моделей фото
    var photos = [Item]()

    /// Массив линков изображений
    var storedImages = [String]()


    //MARK: - LifeCycle
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPhoto()
    }


    // MARK: - UICollectionViewDataSource
    ///numberOfItemsInSection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storedImages.count
    }


    ///cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell

        cell?.photoImageView.loadImage(with: storedImages[indexPath.item])

        cell?.likeControl.isSelected = photos[indexPath.item].likes?.isLiked == 1 ? true : false

        cell?.likeControl.likeCounter = photos[indexPath.item].likes?.likesCounter ?? 0

        cell?.photoDidLiked = { [weak self] isSelected in

            self?.photos[indexPath.item].likes?.isLiked = isSelected ? 1 : 0
        }

        return cell ?? UICollectionViewCell()
    }

    //MARK: - Navigation
    ///prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sliderVC = segue.destination as? SlideShowImageViewController else { return }
            sliderVC.photos = photos
    }
}

extension PhotoCollectionVC {
    func fetchPhoto() {
        Task {
            await getAllPhotos.gettingDataAllPhotos(for: userID) { [weak self] photos in
                self?.photos = photos
                if let imageLinks = self?.sortImage(type: "w", array: photos) {
                    self?.storedImages = imageLinks
                }
            }

                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }

    func sortImage(type: String, array: [Item]) -> [String] {
        var links = [String]()

        for model in array {
            for size in model.sizes {
                if size.type == type {
                    links.append(size.url)
                }
            }
        }
        return links
    }
}

