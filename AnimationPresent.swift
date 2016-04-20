//
//  AnimationPresent.swift
//  CircularCustomTransitionAnimationFinal
//
//  Created by cbluser113 on 09/01/1938 SAKA.
//  Copyright © 1938 SAKA cbluser113. All rights reserved.
//

import UIKit

class AnimationPresent: NSObject, UIViewControllerAnimatedTransitioning
{
    var transitionContext: UIViewControllerContextTransitioning?
    var openingFrame : CGRect?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 1.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        self.transitionContext = transitionContext
        guard let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) , destinationController: UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey), buttonFrame = openingFrame , containerView = transitionContext.containerView() else{return}
        
        let destinationView = destinationController.view
        
        let endFrame = CGRectMake(-CGRectGetWidth(destinationView.frame)/2, -CGRectGetHeight(destinationView.frame)/2, CGRectGetWidth(destinationView.frame)*2, CGRectGetHeight(destinationView.frame)*2)
        
        containerView.insertSubview(destinationController.view, aboveSubview: fromViewController.view)
        
        let extremePoint = CGPoint(x: endFrame.origin.x-CGRectGetWidth(destinationController.view.bounds)*4, y: endFrame.origin.y-CGRectGetHeight(destinationController.view.bounds)*4)
        let radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y))
        
        let maskPath = UIBezierPath(ovalInRect: buttonFrame)
        let bigCirclePath = UIBezierPath(ovalInRect: CGRectInset(endFrame, -radius, -radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = destinationView.frame
        maskLayer.path = maskPath.CGPath
        destinationController.view.layer.mask = maskLayer
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.delegate = self
        pathAnimation.fromValue = maskPath.CGPath
        pathAnimation.toValue = bigCirclePath
        pathAnimation.duration = transitionDuration(transitionContext)
        maskLayer.path = bigCirclePath.CGPath
        maskLayer.addAnimation(pathAnimation, forKey: "pathAnimation")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool)
    {
    self.transitionContext?.completeTransition(true)
       
    }
}
