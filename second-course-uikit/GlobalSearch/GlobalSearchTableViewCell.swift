//
//  GlobalSearchTableViewCell.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 30.03.2022.
//

import UIKit

/// GlobalSearchTableViewCell
class GlobalSearchTableViewCell: UITableViewCell {

    //MARK: - outlets
    @IBOutlet weak var descriptionSearchLable: UILabel!
    @IBOutlet weak var searchLable: UILabel!
    @IBOutlet weak var globalSearchImageView: UIImageView!
    

    //MARK: - initialization
    override func awakeFromNib() {
        super.awakeFromNib()

        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewDidTaped(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        globalSearchImageView.addGestureRecognizer(tap)
        globalSearchImageView.isUserInteractionEnabled = true

    }


    /// selected state method
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
            self.globalSearchImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        },
                       completion: {_ in
            UIView.animate(withDuration: 1, animations: {
                self.globalSearchImageView.transform = .identity

            })
        })
    }
    
}
