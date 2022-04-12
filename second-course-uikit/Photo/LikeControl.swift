//
//  LikeControl.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 06.04.2022.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!

    var likeCounter = 0


    override func awakeFromNib() {
        super.awakeFromNib()
        likeImageView.image = UIImage(named: "cердцеБелое")
    }


    override var isSelected: Bool {

        didSet {
            likeImageView.image = isSelected ? UIImage(named: "сердцеКрасное") : UIImage(named: "cердцеБелое")

            if isSelected {
                likeCounter += 1
            } else {
                likeCounter -= 1
            }

            counterLabel.text = "\(likeCounter)"


        }
    }

}
