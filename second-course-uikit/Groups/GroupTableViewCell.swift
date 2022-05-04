//
//  GroupTableViewCell.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 30.03.2022.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    //MARK: - outlets
    
    @IBOutlet weak var groupDescriptionLable: UILabel!
    @IBOutlet weak var groupLable: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!
    
    
    //MARK: - initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewDidTaped(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        groupImageView.addGestureRecognizer(tap)
        groupImageView.isUserInteractionEnabled = true
        
    }


    //MARK: - selected state method
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @objc func imageViewDidTaped(_ sender: UITapGestureRecognizer) {
        springAnimation()
    }


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
