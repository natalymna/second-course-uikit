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

    var friend: Friend {
        return friends[friendIndex]
    }
    
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.photos.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell
        let friendPhoto = friend.photos[indexPath.row]
        cell?.photoImageView.image = UIImage(named: friendPhoto.imageName)
        cell?.likeControl.isSelected = friendPhoto.isLiked
        
        cell?.photoDidLiked = { isSelected in
            
            friends[self.friendIndex].photos[indexPath.row].isLiked = isSelected
        }
        
        return cell ?? UICollectionViewCell()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sliderVC = segue.destination as? SlideShowImageViewController {
            sliderVC.photos = friend.photos
        }
    }
    
}
