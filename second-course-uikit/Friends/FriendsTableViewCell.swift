//
//  FriendsTableViewCell.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 28.03.2022.
//

import UIKit

/// FriendsTableViewCell
class FriendsTableViewCell: UITableViewCell {


    //MARK: - IBOutlets
    @IBOutlet weak var titleCell: UIView!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var friendsImageView: UIImageView!
    @IBOutlet weak var conteinerView: ConteinerView!
    @IBOutlet weak var shadowView: ShadowView!
    

    //MARK: - initialization
    ///awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()

        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewDidTaped(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        friendsImageView.addGestureRecognizer(tap)
        friendsImageView.isUserInteractionEnabled = true
    }


    //MARK: - selected state method
    ///setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    ///imageViewDidTaped
    @objc func imageViewDidTaped(_ sender: UITapGestureRecognizer) {
        springAnimation()
    }


    ///springAnimation
    func springAnimation() {
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.2,
                       options: [],
                       animations: {
            self.friendsImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        },
                       completion: {_ in
            UIView.animate(withDuration: 1, animations: {
                self.friendsImageView.transform = .identity

            })
        })
    }
    
}
