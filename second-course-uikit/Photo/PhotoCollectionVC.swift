//
//  PhotoCollectionVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit

//private let reuseIdentifier = "Cell"

class PhotoCollectionVC: UICollectionViewController {

    //MARK: - properties

    var friendPhotos = [String]()


    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendPhotos.count
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell
        let friendPhoto = friendPhotos[indexPath.row]
        cell?.photoImageView.image = UIImage(named: friendPhoto)

        return cell ?? UICollectionViewCell()
    }


}
