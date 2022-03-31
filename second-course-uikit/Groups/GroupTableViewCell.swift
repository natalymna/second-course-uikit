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
        
    }


    //MARK: - selected state method
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
