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
    @IBOutlet weak var leftConstraintCount: NSLayoutConstraint!
    @IBOutlet weak var rightConstraintHeart: NSLayoutConstraint!

    var likeCounter = 0


    override func awakeFromNib() {
        super.awakeFromNib()
        likeImageView.image = UIImage(named: "cердцеБелое")
    }


    override var isSelected: Bool {

        didSet {
            guard oldValue != isSelected else { return }

            likeImageView?.image = isSelected ? UIImage(named: "сердцеКрасное") : UIImage(named: "cердцеБелое")

            if isSelected {
                likeCounter += 1

                UIView.animate(withDuration: 2,
                               delay: 2,
                               options: [.curveEaseInOut],
                               animations: {
                    self.rightConstraintHeart.constant = 17
                    self.counterLabel.layoutIfNeeded()
                })

                UIView.animate(withDuration: 2,
                               delay: 2,
                               options: [.curveEaseInOut],
                               animations: {
                    self.leftConstraintCount.constant = 20
                    self.likeImageView.layoutIfNeeded()

                })

            } else {
                likeCounter -= 1

                UIView.animate(withDuration: 2,
                               delay: 2,
                               options: [.curveEaseInOut],
                               animations: {
                    self.rightConstraintHeart.constant = 0
                    self.counterLabel.layoutIfNeeded()
                })

                UIView.animate(withDuration: 2,
                               delay: 2,
                               options: [.curveEaseInOut],
                               animations: {
                    self.leftConstraintCount.constant = 0
                    self.likeImageView.layoutIfNeeded()
                })
            }

            counterLabel?.text = "\(likeCounter)"
        }
    }

}
