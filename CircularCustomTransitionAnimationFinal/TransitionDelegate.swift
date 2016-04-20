//
//  TransitionDelegate.swift
//  CircularCustomTransitionAnimationFinal
//
//  Created by cbluser113 on 09/01/1938 SAKA.
//  Copyright © 1938 SAKA cbluser113. All rights reserved.
//

import UIKit

class TransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    var openingFrame : CGRect?
    
  
    // called when second ViewController is presented....
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let presentationanimator = AnimationPresent()
        presentationanimator.openingFrame = openingFrame
        return presentationanimator
    }
    
  
    // called when ViewController gets dismissed....
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let dismissedAnimator = AnimationDismissed()
        dismissedAnimator.openingFrame = openingFrame
        return dismissedAnimator
    }

}
