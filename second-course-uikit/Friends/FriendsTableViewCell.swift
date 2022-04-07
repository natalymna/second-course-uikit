//
//  FriendsTableViewCell.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 28.03.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {


    //MARK: - outlets
    
    @IBOutlet weak var titleCell: UIView!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var friendsImageView: UIImageView!
    @IBOutlet weak var conteinerView: ConteinerView!
    @IBOutlet weak var shadowView: ShadowView!
    

    //MARK: - initialization

    override func awakeFromNib() {
        super.awakeFromNib()

    }


    //MARK: - selected state method
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

    }
    
}
