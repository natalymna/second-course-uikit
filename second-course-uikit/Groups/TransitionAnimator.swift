//
//  TransitionAnimator.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 27.04.2022.
//

import UIKit

/// TransitionAnimator
class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    //MARK: - properties
    let animationDuration: TimeInterval = 2

    let isPresenting: Bool
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }

    ///transitionDuration
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }

    ///animateTransition
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            animateForPresent(using: transitionContext)
        } else {
            animateForDismiss(using: transitionContext)
        }
    }

    ///animateForDismiss
    func animateForDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else { return }

        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)

        setAnchorPoint(anchorPoint: CGPoint(x: 0, y: 0), forView: destination.view)
        destination.view.frame = transitionContext.containerView.frame
        destination.view.transform = CGAffineTransform(rotationAngle: .pi/2)


        setAnchorPoint(anchorPoint: CGPoint(x: 1, y: 0), forView: source.view)
        source.view.frame = transitionContext.containerView.frame

        UIView.animate(
            withDuration: animationDuration,
            animations: {
                source.view.transform = CGAffineTransform(rotationAngle: -.pi/2)
                destination.view.transform = .identity
            }) { isComplete in

            if isComplete && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition( isComplete && !transitionContext.transitionWasCancelled)
            destination.view.isHidden = false
        }
    }


    ///setAnchorPoint
    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
        var newPoint = CGPoint(x: view.bounds.size.width * anchorPoint.x,
                               y: view.bounds.size.height * anchorPoint.y)


        var oldPoint = CGPoint(x: view.bounds.size.width * view.layer.anchorPoint.x,
                               y: view.bounds.size.height * view.layer.anchorPoint.y)

        newPoint = newPoint.applying(view.transform)
        oldPoint = oldPoint.applying(view.transform)

        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
    }


    ///animateForPresent
    func animateForPresent (using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else { return }

        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)

        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
        destination.view.frame = transitionContext.containerView.frame
        destination.view.transform = CGAffineTransform(rotationAngle: -.pi/2)

        source.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
        source.view.frame = transitionContext.containerView.frame

        UIView.animate(
            withDuration: animationDuration,
            animations: {
                source.view.transform = CGAffineTransform(rotationAngle: .pi/2)
                destination.view.transform = .identity
            }) { isComplete in
            if isComplete && !transitionContext.transitionWasCancelled {

            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition( isComplete && !transitionContext.transitionWasCancelled)
        }
    }

}
