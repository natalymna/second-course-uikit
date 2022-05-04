//
//  CustomNavigationController.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 28.04.2022.
//

import UIKit

class CustomNavigationController: UINavigationController {

    var interactiveTransitin: CustomInteractiveTransition?

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }

}

extension CustomNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            interactiveTransitin = CustomInteractiveTransition(poppingViewController: toVC)
            return TransitionAnimator(isPresenting: true)
        case .pop:

            return TransitionAnimator(isPresenting: false)
        default:
            return nil
        }
    }

    func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {

        return (interactiveTransitin?.hasStarted ?? false) ? interactiveTransitin : nil

    }

}


class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {

    let poppingViewController: UIViewController

    var hasStarted: Bool = false
    var shouldFinish: Bool = false

    init(poppingViewController: UIViewController) {
        self.poppingViewController = poppingViewController

        super.init()

        let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(scrennDidPan(_:)))
        recognizer.edges = .left
        poppingViewController.view.addGestureRecognizer(recognizer)
    }

    @objc func scrennDidPan(_ sender: UIScreenEdgePanGestureRecognizer) {
        switch sender.state {
        case .began:
            hasStarted = true
            poppingViewController.navigationController?.popViewController(animated: true)

        case .changed:
            let transition = sender.translation(in: poppingViewController.view)
            let relativeTrensition = transition.x / poppingViewController.view.bounds.width
            let progress = max(0, min(1, relativeTrensition))
            shouldFinish = progress > 0.4
            update(progress)

        case .cancelled:
            hasStarted = false
            cancel()

        case .ended:
            hasStarted = false
            hasStarted ? finish() : cancel()

        default:
            break

        }

    }
}
