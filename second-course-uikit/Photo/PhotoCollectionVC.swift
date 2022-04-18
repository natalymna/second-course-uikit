//
//  PhotoCollectionVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit


class PhotoCollectionVC: UICollectionViewController {

    //MARK: - properties

    var friendIndex: Int = 0
//    var friendPhotos = [Photo]()
   


    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return friendPhotos.count
        return friends[friendIndex].photos.count
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell
//        let friendPhoto = friendPhotos[indexPath.row]
        let friendPhoto = friends[friendIndex].photos[indexPath.row]
        cell?.photoImageView.image = UIImage(named: friendPhoto.imageName)
        cell?.likeControl.isSelected = friendPhoto.isLiked

        cell?.photoDidLiked = { isSelected in
//            self.friendPhotos[indexPath.row].isLiked = isSelected
            
            friends[self.friendIndex].photos[indexPath.row].isLiked = isSelected
        }

        return cell ?? UICollectionViewCell()
    }


}
