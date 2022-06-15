//
//  SlideShowImageViewController.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 22.04.2022.
//

import UIKit

/// SlideShowImageViewController
class SlideShowImageViewController: UIViewController {

    //MARK: - properties
    var photos = [Item]()
    var currentPhotoIndex: Int?

    var nextPhotoIndex: Int? {
        guard let index = currentPhotoIndex else { return nil }
        let nextIndex = index + 1
        return nextIndex < photos.count ? nextIndex : nil
    }

    var previousPhotoIndex: Int? {
        guard let index = currentPhotoIndex else { return nil }
        let prevIndex = index - 1
        return prevIndex >= 0 ? prevIndex : nil
    }

    var currentPhoto: Item? {
        guard let index = currentPhotoIndex else { return nil }
        return photos[index]
    }


    //MARK: - IBOutlets
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!

    var currentImageView: UIImageView? {
        [firstImageView, secondImageView].first(where: { !$0.isHidden })
    }

    var hiddenImageView: UIImageView? {
        [firstImageView, secondImageView].first(where: { $0.isHidden})
    }


    //MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        currentPhotoIndex = photos.isEmpty ? nil : 0
        guard let currentPhotoIndex = currentPhotoIndex,
        let currentPhoto = currentPhoto
        else { return }

        firstImageView.frame = view.bounds
        firstImageView.loadImage(with: currentPhoto.sizes[currentPhotoIndex].url)

//        guard let photoURL = currentPhoto?.sizes[currentPhotoIndex].url,
//              let path = URL(string: photoURL),
//              let imageData = try? Data(contentsOf: path, options: .uncached),
//              let slideShowPhoto = UIImage(data: imageData)
//        else { return }
//
//        firstImageView.image = slideShowPhoto



        secondImageView.frame = view.bounds
        secondImageView.isHidden = true

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_ :)))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_ :)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
    }


    //MARK: - viewDidSwipe
    @objc func viewDidSwipe (_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            swipeToRight()
        case .left:
            swipeToLeft()
        default:
            break
        }

    }



    /// swipeToRight
    func swipeToRight() {
        guard let previousPhotoIndex = previousPhotoIndex,
        let currentPhoto = currentPhoto
        else { return }

        let hiddenImageView = hiddenImageView
        let currentImageView = currentImageView

        hiddenImageView?.loadImage(with: currentPhoto.sizes[previousPhotoIndex].url)

//        guard let photoURL = currentPhoto?.sizes[previousPhotoIndex].url,
//              let path = URL(string: photoURL),
//              let imageData = try? Data(contentsOf: path, options: .uncached),
//              let slideShowPhotoPrevious = UIImage(data: imageData)
//        else { return }
//
//        hiddenImageView?.image = slideShowPhotoPrevious
        hiddenImageView?.frame.origin.x = -view.bounds.width
        hiddenImageView?.isHidden = false

        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: 0,
            animations: {

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.25,
                    animations: {
                        currentImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    })

                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.75,
                    animations: {
                        hiddenImageView?.frame.origin.x = 0
                        currentImageView?.frame.origin.x = self.view.bounds.maxX
                    })
            },
            completion: {_ in
                self.currentPhotoIndex = previousPhotoIndex
                currentImageView?.isHidden = true
                currentImageView?.transform = .identity
            })

    }


    /// swipeToLeft
    func swipeToLeft() {
        guard let nextPhotoIndex = nextPhotoIndex,
        let currentPhoto = currentPhoto
        else { return }

        let hiddenImageView = hiddenImageView
        let currentImageView = currentImageView

        hiddenImageView?.loadImage(with: currentPhoto.sizes[nextPhotoIndex].url)

//        guard let photoURL = currentPhoto?.sizes[nextPhotoIndex].url, nextPhotoIndex <= (photos.count - 1),
//              let path = URL(string: photoURL),
//              let imageData = try? Data(contentsOf: path, options: .uncached),
//              let slideShowPhotoNext = UIImage(data: imageData)
//        else { return }

//        hiddenImageView?.image = slideShowPhotoNext
        hiddenImageView?.frame.origin.x = view.bounds.maxX
        hiddenImageView?.isHidden = false

        UIImageView.animateKeyframes(
            withDuration: 0.9,
            delay: 0,
            animations: {

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.25,
                    animations: {
                        currentImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    })

                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.75,
                    animations: {
                        hiddenImageView?.frame.origin.x = 0
                        currentImageView?.frame.origin.x = -self.view.bounds.width
                    })
            },
            completion: {_ in
                self.currentPhotoIndex = nextPhotoIndex
                currentImageView?.isHidden = true
                currentImageView?.transform = .identity
            })

    }
}
