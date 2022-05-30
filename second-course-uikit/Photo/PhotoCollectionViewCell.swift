//
//  PhotoCollectionViewCell.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 29.03.2022.
//

import UIKit

/// PhotoCollectionViewCell
class PhotoCollectionViewCell: UICollectionViewCell {

    //MARK: - outlets
    @IBOutlet weak var likeControl: LikeControl!
    @IBOutlet weak var photoImageView: UIImageView!

    //MARK: - properties
    var photoDidLiked: ((Bool) -> Void)?


    ///awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()

        likeControl.addTarget(self, action: #selector(likeControlTapped), for: .touchUpInside)
    }


    ///likeControlTapped
    @objc func likeControlTapped() {
        likeControl.isSelected = !likeControl.isSelected
        photoDidLiked?(likeControl.isSelected)

    }
}
