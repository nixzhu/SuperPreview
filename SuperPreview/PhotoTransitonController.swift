//
//  PhotoTransitonController.swift
//  SuperPreview
//
//  Created by NIX on 2016/11/28.
//  Copyright © 2016年 nixWork. All rights reserved.
//

import UIKit

class PhotoTransitonController: NSObject {

    lazy var animator = PhotoTransitionAnimator()
    lazy var interactionController = PhotoDismissalInteractionController()

    var forcesNonInteractiveDismissal = true

    var startingReference: Reference? {
        return animator.startingReference
    }

    func setStartingReference(_ reference: Reference?) {
        animator.startingReference = reference
    }

    var endingReference: Reference? {
        return animator.endingReference
    }

    func setEndingReference(_ reference: Reference?) {
        animator.endingReference = reference
    }

    func didPanWithPanGestureRecognizer(_ pan: UIPanGestureRecognizer, viewToPan: UIView, anchorPoint: CGPoint) {
        interactionController.didPanWithPanGestureRecognizer(pan, viewToPan: viewToPan, anchorPoint: anchorPoint)
    }
}

extension PhotoTransitonController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.isDismissing = false
        return animator
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.isDismissing = true
        return animator
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if forcesNonInteractiveDismissal {
            return nil
        }
        if let endingView = endingReference?.imageView {
            self.animator.endingViewForAnimation = PhotoTransitionAnimator.newAnimationView(from: endingView)
        }
        interactionController.animator = animator
        interactionController.shouldAnimateUsingAnimator = (endingReference?.view != nil)
        interactionController.viewToHideWhenBeginningTransition = (startingReference?.view == nil) ? nil : endingReference?.view
        return interactionController
    }
}
