//
//  ViewController.swift
//  CircularCustomTransitionAnimationFinal
//
//  Created by cbluser113 on 09/01/1938 SAKA.
//  Copyright © 1938 SAKA cbluser113. All rights reserved.
//

import UIKit

class ViewController: BaseViewController{

    @IBOutlet weak var animateBtn: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.curvedBtn(animateBtn)
               
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func animationStart(sender: AnyObject)
    {
       
    guard let destination = self.storyboard?.instantiateViewControllerWithIdentifier("NextViewController") as? NextViewController else {return}
        
        transitionDelegate.openingFrame = animateBtn.frame
        destination.transitioningDelegate = transitionDelegate
        destination.modalPresentationStyle = .Custom
        presentViewController(destination, animated: true, completion: nil)
    }
    
}

