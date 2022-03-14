//
//  LoginViewController.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 09.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - outlet properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var vkImageView: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    //MARK: - action property
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let login = loginTextField.text!
        let password = passwordTextField.text!

        if login == "admin" && password == "123" {
            print("Successful authorization")
        } else {
            print("Not successful authorization")
        }
    }


    //MARK: - objc func
    @objc func keyboardWasShown(notification: Notification) {

        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue) .cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }


    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }


    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }


    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))

        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }


    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }


    //MARK: - viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

}
