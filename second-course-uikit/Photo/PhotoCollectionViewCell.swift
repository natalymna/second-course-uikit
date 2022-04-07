//
//  PhotoCollectionViewCell.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 29.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    //MARK: - outlets

    @IBOutlet weak var likeControl: LikeControl!
    
    @IBOutlet weak var photoImageView: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()

        likeControl.addTarget(self, action: #selector(likeControlTapped), for: .touchUpInside)

    }

    @objc func likeControlTapped() {
        likeControl.isSelected = !likeControl.isSelected

    }
}
