//
//  MakeShadow.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 07.04.2022.
//

import UIKit

/// ConteinerView - for making shadow
class ConteinerView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 50
    }

}


/// ShadowView - for making shadow
/*@IBDesignable*/ class ShadowView: UIView {

    //MARK: - properties
    /*@IBInspectable*/ var cornerRadius: CGFloat = 50 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    /*@IBInspectable*/ var shadowRadius: CGFloat = 15 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }

    /*@IBInspectable*/ var shadowColor: UIColor = .gray {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }

    /*@IBInspectable*/ var shadowOpacity: Float = 1 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }

    /*@IBInspectable*/ var shadowOffset = CGSize(width: 15, height: 15) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }


    /// awakeFromNib - making shadow
    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = .clear

        layer.cornerRadius = cornerRadius

        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
    }

}
