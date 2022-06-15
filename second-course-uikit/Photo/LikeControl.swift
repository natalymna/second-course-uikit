//
//  LikeControl.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 06.04.2022.
//

import UIKit

/// LikeControl
class LikeControl: UIControl {

    //MARK: - properties
    var photos = [Item]()
    private var likeCounter: Int = 0


    //MARK: - IBOutlets
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var leftConstraintCount: NSLayoutConstraint!
    @IBOutlet weak var rightConstraintHeart: NSLayoutConstraint!


    ///awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        likeImageView.image = UIImage(named: "cердцеБелое")

//        guard let count = Int(Likes.LikeCount.likesCounter.rawValue) else { return }
//        likeCounter = count
    }


    override var isSelected: Bool {

        didSet {
            guard oldValue != isSelected else { return }

            likeImageView?.image = isSelected ? UIImage(named: "сердцеКрасное") : UIImage(named: "cердцеБелое")



            if isSelected {

                likeCounter += 1

                UIView.animate(withDuration: 2,
                               delay: 0,
                               options: [.curveEaseInOut],
                               animations: {
                    self.rightConstraintHeart.constant = 17
                    self.leftConstraintCount.constant = 20
                    self.layoutIfNeeded()
                })

            } else {
                likeCounter -= 1

                UIView.animate(withDuration: 2,
                               delay: 0,
                               options: [.curveEaseInOut],
                               animations: {
                    self.rightConstraintHeart.constant = 0
                    self.leftConstraintCount.constant = 0
                    self.layoutIfNeeded()
                })
            }

            counterLabel?.text = "\(likeCounter)"
        }
    }

}
