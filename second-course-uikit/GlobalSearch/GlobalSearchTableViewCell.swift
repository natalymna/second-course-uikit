//
//  GlobalSearchTableViewCell.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 30.03.2022.
//

import UIKit

class GlobalSearchTableViewCell: UITableViewCell {

    //MARK: - outlets
    
    @IBOutlet weak var descriptionSearchLable: UILabel!
    @IBOutlet weak var searchLable: UILabel!
    @IBOutlet weak var globalSearchImageView: UIImageView!
    

    //MARK: - initialization

    override func awakeFromNib() {
        super.awakeFromNib()

    }


    //MARK: - selected state method

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
