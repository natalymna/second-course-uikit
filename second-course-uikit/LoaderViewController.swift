//
//  LoaderViewController.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 19.04.2022.
//

import UIKit

/// LoaderViewController
class LoaderViewController: UIViewController {


    //MARK: - IBOutlets
    @IBOutlet weak var loaderOneView: UIView!
    @IBOutlet weak var loaderTwoView: UIView!
    @IBOutlet weak var loaderThreeView: UIView!


    //MARK: - LifeCycle
    ///viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(presentationTimeSegue), userInfo: nil, repeats: false)

        loaderOneView.layer.cornerRadius = loaderOneView.frame.size.height / 2
        loaderTwoView.layer.cornerRadius = loaderOneView.frame.size.height / 2
        loaderThreeView.layer.cornerRadius = loaderOneView.frame.size.height / 2
    }
    

    ///viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        animationLoader()
    }


    ///animationLoader
    func animationLoader() {

        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.loaderOneView.alpha = 0
        })

        UIView.animate(withDuration: 0.7,
                       delay: 0.5,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.loaderTwoView.alpha = 0
        })

        UIView.animate(withDuration: 0.7,
                       delay: 1,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.loaderThreeView.alpha = 0
        })
    }
    


    ///presentationTimeSegue
    @objc func presentationTimeSegue() {
        self.view.layer.removeAllAnimations()
        self.performSegue(withIdentifier: "goToTabBarController", sender: self)
    }

}


