//
//  AnimationDismissed.swift
//  CircularCustomTransitionAnimationFinal
//
//  Created by cbluser113 on 09/01/1938 SAKA.
//  Copyright © 1938 SAKA cbluser113. All rights reserved.
//

import UIKit

class AnimationDismissed: NSObject,UIViewControllerAnimatedTransitioning
{
    
    var transitionContext: UIViewControllerContextTransitioning?
    var openingFrame : CGRect?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
    
        return 0.12
    }
   
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
       
   self.transitionContext = transitionContext
   guard let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey), endFrame = openingFrame, containerView = transitionContext.containerView(),destinationController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) else{return}
        
        containerView.insertSubview(destinationController.view, aboveSubview: fromViewController.view)
        //containerView.insertSubview(fromViewController.view, belowSubview: destinationController.view)
        
    let buttonFrame = CGRectMake(-CGRectGetWidth(destinationController.view.frame)/2, -CGRectGetHeight(destinationController.view.frame)/2, CGRectGetWidth(destinationController.view.frame)*2, CGRectGetHeight(destinationController.view.frame)*2)
        
    let extremePoint = CGPoint(x: endFrame.origin.x - endFrame.size.width/2-CGRectGetWidth(destinationController.view.bounds)*4, y: endFrame.origin.y - endFrame.size.height/2 - CGRectGetHeight(destinationController.view.bounds)*4)

        let radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y))
        let maskPath = UIBezierPath(ovalInRect: CGRectInset(buttonFrame, -radius, -radius))
        let bigCirclePath = UIBezierPath(ovalInRect: endFrame)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = destinationController.view.frame
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
    guard let myContext = self.transitionContext, destinationController = myContext.viewControllerForKey(UITransitionContextToViewControllerKey)  else{return }
        destinationController.view.removeFromSuperview()
    myContext.completeTransition(true)
    guard let _ = UIApplication.sharedApplication().keyWindow?.addSubview(destinationController.view) else{return}
        
    }
}
