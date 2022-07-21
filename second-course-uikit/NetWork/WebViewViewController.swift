//
//  WebViewViewController.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 24.05.2022.
//

import Foundation
import WebKit


/// WebViewViewController
class WebViewViewController: UIViewController {


    //MARK: - IBOutlets
    @IBOutlet weak var webKitView: WKWebView?



    //MARK: - LifeCicle
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        authorization()
    }


    // MARK: - Authorization
    private func authorization() {

        self.webKitView?.navigationDelegate = self

        var urlComponents = URLComponents(string: "https://oauth.vk.com/authorize")

        urlComponents?.queryItems = [
            URLQueryItem(name: "client_id", value: "8175049"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: Constants.constants.currentApiVersion)
        ]

        guard let url = urlComponents?.url else { return }

        let request = URLRequest(url: url)

        self.webKitView?.load(request)
    }

}


//MARK: - WKNavigationDelegate
extension WebViewViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        guard
            let url = navigationResponse.response.url,
            let fragment = url.fragment,
            url.path == "/blank.html"
        else {
            decisionHandler(.allow)

            return
        }

        let parameters = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce(Dictionary<String, String>()) { partialResult, parameter in
                var dictionary = partialResult
                let key = parameter[0]
                let value = parameter[1]

                dictionary[key] = value

                return dictionary
            }

        guard
            let token = parameters["access_token"],
            let userIDString = parameters["user_id"],
            let userID = Int(userIDString)
        else {
            return
        }

        MySession.shared.token = token
        MySession.shared.userID = userID

        print("access token - ", token)

        decisionHandler(.cancel)

        performSegue(withIdentifier: "presentLoader", sender: self)
    }
}
