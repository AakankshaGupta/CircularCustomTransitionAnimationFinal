//
//  NextViewController.swift
//  CircularCustomTransitionAnimationFinal
//
//  Created by cbluser113 on 09/01/1938 SAKA.
//  Copyright © 1938 SAKA cbluser113. All rights reserved.
//

import UIKit

class NextViewController: UIViewController
{
    @IBOutlet weak var backBtn: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        backBtn.layer.borderWidth = 5.0
        backBtn.layer.masksToBounds = false
        backBtn.layer.borderColor = UIColor.whiteColor().CGColor
        backBtn.layer.cornerRadius = backBtn.frame.size.width/2
        backBtn.clipsToBounds = true
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    @IBAction func backBtnAction(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    
    
}
