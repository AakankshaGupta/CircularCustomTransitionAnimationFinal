//
//  BaseViewController.swift
//  CircularCustomTransitionAnimationFinal
//
//  Created by cbluser113 on 11/01/1938 SAKA.
//  Copyright © 1938 SAKA cbluser113. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    let transitionDelegate = TransitionDelegate()
    var tapGesture = UITapGestureRecognizer()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // to curve a button...
    func curvedBtn(myButton: UIButton)
    {
        myButton.layer.borderWidth = 5.0
        myButton.layer.masksToBounds = false
        myButton.layer.borderColor = UIColor.whiteColor().CGColor
        myButton.layer.cornerRadius = myButton.frame.size.width/2
        myButton.clipsToBounds = true

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
