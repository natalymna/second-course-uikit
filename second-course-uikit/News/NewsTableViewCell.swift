//
//  NewsTableViewCell.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 15.04.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsNameLabel: UILabel!
    @IBOutlet weak var bodyNameLabel: UILabel!
    @IBOutlet weak var photoNewsImageView: UIImageView!
    @IBOutlet weak var likeControlView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var messageControlView: UIView!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var forwardControllView: UIView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var forwardLabel: UILabel!
    @IBOutlet weak var viewsControlView: UIView!
    @IBOutlet weak var viewsButton: UIButton!
    @IBOutlet weak var viewsLabel: UILabel!



    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupAvatarImageView()
        setupAvatarNameLabel()
        setupDateLabel()
        setupNewsNameLabel()
        setupBodyNameLabel()
        setupPhotoNewsImageView()
        setupLikeControlView()
        setupMessageControllView()
        setupForwardControllView()
        setupViewsControlView()

        tap()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }



    private func setupAvatarImageView() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setupAvatarNameLabel() {
        avatarNameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        avatarNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20).isActive = true
    }

    private func setupDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: avatarNameLabel.bottomAnchor, constant: 5).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20).isActive = true
    }

    private func setupNewsNameLabel() {
        newsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        newsNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
        newsNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        newsNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }

    private func setupBodyNameLabel() {
        bodyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyNameLabel.topAnchor.constraint(equalTo: newsNameLabel.bottomAnchor, constant: 10).isActive = true
        bodyNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        bodyNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }

    private func setupPhotoNewsImageView() {
        photoNewsImageView.translatesAutoresizingMaskIntoConstraints = false

        photoNewsImageView.topAnchor.constraint(equalTo: bodyNameLabel.bottomAnchor, constant: 10).isActive = true
        photoNewsImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        photoNewsImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        photoNewsImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
    }

    func setupLikeControlView() {
        likeControlView.translatesAutoresizingMaskIntoConstraints = false
        likeControlView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        likeControlView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        likeControlView.topAnchor.constraint(equalTo: photoNewsImageView.bottomAnchor, constant: 7).isActive = true
        likeControlView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        likeControlView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true

        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.topAnchor.constraint(equalTo: likeControlView.topAnchor, constant: 3).isActive = true
        likeButton.leftAnchor.constraint(equalTo: likeControlView.leftAnchor, constant: 7).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: likeControlView.bottomAnchor, constant: -3).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.centerYAnchor.constraint(equalTo: likeControlView.centerYAnchor).isActive = true
        likeLabel.rightAnchor.constraint(equalTo: likeControlView.rightAnchor, constant: -7).isActive = true
    }

    func setupMessageControllView() {
        messageControlView.translatesAutoresizingMaskIntoConstraints = false
        messageControlView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        messageControlView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        messageControlView.topAnchor.constraint(equalTo: photoNewsImageView.bottomAnchor, constant: 7).isActive = true
        messageControlView.leftAnchor.constraint(equalTo: likeControlView.rightAnchor, constant: 7).isActive = true
        messageControlView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true

        messageButton.translatesAutoresizingMaskIntoConstraints = false
        messageButton.topAnchor.constraint(equalTo: messageControlView.topAnchor, constant: 3).isActive = true
        messageButton.leftAnchor.constraint(equalTo: messageControlView.leftAnchor, constant: 7).isActive = true
        messageButton.bottomAnchor.constraint(equalTo: messageControlView.bottomAnchor, constant: -3).isActive = true
        messageButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.centerYAnchor.constraint(equalTo: messageControlView.centerYAnchor).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: messageControlView.rightAnchor, constant: -7).isActive = true
    }

    func setupForwardControllView() {
        forwardControllView.translatesAutoresizingMaskIntoConstraints = false
        forwardControllView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        forwardControllView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        forwardControllView.topAnchor.constraint(equalTo: photoNewsImageView.bottomAnchor, constant: 7).isActive = true
        forwardControllView.leftAnchor.constraint(equalTo: messageControlView.rightAnchor, constant: 7).isActive = true
        forwardControllView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true

        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.topAnchor.constraint(equalTo: forwardControllView.topAnchor, constant: 3).isActive = true
        forwardButton.leftAnchor.constraint(equalTo: forwardControllView.leftAnchor, constant: 7).isActive = true
        forwardButton.bottomAnchor.constraint(equalTo: forwardControllView.bottomAnchor, constant: -3).isActive = true
        forwardButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        forwardLabel.translatesAutoresizingMaskIntoConstraints = false
        forwardLabel.centerYAnchor.constraint(equalTo: forwardControllView.centerYAnchor).isActive = true
        forwardLabel.rightAnchor.constraint(equalTo: forwardControllView.rightAnchor, constant: -7).isActive = true
    }

    func setupViewsControlView() {
        viewsControlView.translatesAutoresizingMaskIntoConstraints = false
        viewsControlView.widthAnchor.constraint(equalToConstant: 68).isActive = true
        viewsControlView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        viewsControlView.topAnchor.constraint(equalTo: photoNewsImageView.bottomAnchor, constant: 7).isActive = true
        viewsControlView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        viewsControlView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true

        viewsButton.translatesAutoresizingMaskIntoConstraints = false
        viewsButton.topAnchor.constraint(equalTo: viewsControlView.topAnchor, constant: 3).isActive = true
        viewsButton.leftAnchor.constraint(equalTo: viewsControlView.leftAnchor, constant: 7).isActive = true
        viewsButton.bottomAnchor.constraint(equalTo: viewsControlView.bottomAnchor, constant: -3).isActive = true
        viewsButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.centerYAnchor.constraint(equalTo: viewsControlView.centerYAnchor).isActive = true
        viewsLabel.rightAnchor.constraint(equalTo: viewsControlView.rightAnchor, constant: -7).isActive = true
    }


    @objc func imageViewDidTaped(_ sender: UITapGestureRecognizer) {
        springAnimation()
    }


    func tap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewDidTaped(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        avatarImageView.addGestureRecognizer(tap)
        avatarImageView.isUserInteractionEnabled = true
    }


    func springAnimation() {
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.2,
                       options: [],
                       animations: {
            self.avatarImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        },
                       completion: {_ in
            UIView.animate(withDuration: 1, animations: {
                self.avatarImageView.transform = .identity

            })
        })
    }
}
