//
//  Extension+UIImageView.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 08.06.2022.
//

import UIKit

extension UIImageView {
    func loadImage(with url: String, placeHolder: UIImage? = nil) {
        self.image = nil

        let imageUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: imageUrl) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.image = placeHolder
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        if let data = data {
                            if let image = UIImage(data: data) {
                                self.image = image
                            }
                        }
                    }
                }.resume()
            }
        }
    }
}
