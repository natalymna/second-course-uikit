//
//  GroupTableViewCell.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 30.03.2022.
//

import UIKit

/// GroupTableViewCell
class GroupTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var groupDescriptionLable: UILabel!
    @IBOutlet weak var groupLable: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!
    
    
    //MARK: - initialization
    /// awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()

        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewDidTaped(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        groupImageView.addGestureRecognizer(tap)
        groupImageView.isUserInteractionEnabled = true
        
    }


    //MARK: - selected state method
    /// setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    /// imageViewDidTaped
    /// - Parameter sender: UITapGestureRecognizer
    @objc func imageViewDidTaped(_ sender: UITapGestureRecognizer) {
        springAnimation()
    }


    /// springAnimation
    func springAnimation() {
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.2,
                       options: [],
                       animations: {
            self.groupImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        },
                       completion: {_ in
            UIView.animate(withDuration: 1, animations: {
                self.groupImageView.transform = .identity

            })
        })
    }

}
