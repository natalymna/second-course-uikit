//
//  NewsTableViewController.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 15.04.2022.
//

import UIKit

/// NewsTableViewController
class NewsTableViewController: UITableViewController {

    let presentNews = New.news


    //MARK: - LifeCicle
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return presentNews.count

    }

    //MARK: - Cell decoration
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewsTableViewCell
        let new = presentNews[indexPath.row]
        cell?.avatarImageView.image = new.avatar
        cell?.avatarImageView.layer.cornerRadius = 25

        cell?.avatarNameLabel.text = new.avatarName
        cell?.avatarNameLabel.font = UIFont.boldSystemFont(ofSize: 18)

        cell?.dateLabel.text = new.date
        cell?.dateLabel.font = UIFont.systemFont(ofSize: 14)

        cell?.newsNameLabel.text = new.newsName
        cell?.newsNameLabel.textColor = UIColor.black
        cell?.newsNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        cell?.newsNameLabel.numberOfLines = 0

        cell?.bodyNameLabel.text = new.bodyNews
        cell?.bodyNameLabel.font = UIFont.systemFont(ofSize: 17)
        cell?.bodyNameLabel.textAlignment = .justified
        cell?.bodyNameLabel.numberOfLines = 0
        
        cell?.photoNewsImageView.image = new.photoNews
        cell?.photoNewsImageView.contentMode = .scaleAspectFill

        cell?.likeControlView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        cell?.likeControlView.layer.cornerRadius = 10

        cell?.likeButton.setTitle("", for: .normal)
        cell?.likeButton.setImage(UIImage(named: "icons8-червы-50"), for: .normal)

        cell?.likeLabel.text = "0"
        cell?.likeLabel.font = UIFont.systemFont(ofSize: 12)
        cell?.likeLabel.textColor = .gray

        cell?.messageControlView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        cell?.messageControlView.layer.cornerRadius = 10

        cell?.messageButton.setTitle("", for: .normal)
        cell?.messageButton.setImage(UIImage(named: "сообщение_серый"), for: .normal)

        cell?.messageLabel.text = "95"
        cell?.messageLabel.font = UIFont.systemFont(ofSize: 12)
        cell?.messageLabel.textColor = .gray

        cell?.forwardControllView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        cell?.forwardControllView.layer.cornerRadius = 10

        cell?.forwardButton.setTitle("", for: .normal)
        cell?.forwardButton.setImage(UIImage(named: "icons8-переслать-50"), for: .normal)

        cell?.forwardLabel.text = "38"
        cell?.forwardLabel.font = UIFont.systemFont(ofSize: 12)
        cell?.forwardLabel.textColor = .gray

        cell?.viewsControlView.backgroundColor = .white
        cell?.viewsControlView.layer.cornerRadius = 10
        
        cell?.viewsButton.setTitle("", for: .normal)
        cell?.viewsButton.setImage(UIImage(named: "глаз серый"), for: .normal)

        cell?.viewsLabel.text = "1,21k"
        cell?.viewsLabel.font = UIFont.systemFont(ofSize: 12)
        cell?.viewsLabel.textColor = .gray


        return cell ?? UITableViewCell()
    }

}
