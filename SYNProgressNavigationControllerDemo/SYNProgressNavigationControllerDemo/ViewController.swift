//
//  ViewController.swift
//  SYNProgressNavigationControllerDemo
//
//  Created by Sidhant Gandhi on 6/22/15.
//  Copyright (c) 2015 Syntertainment. All rights reserved.
//

import SYNProgressNavigationController
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func refreshTapped(sender: UIBarButtonItem) {
        if let nav = navigationController as? SYNProgressNavigationController {
            
            nav.progressBar.tintColor = UIColor.blueColor()
            nav.progressBar.trackTintColor = UIColor.lightGrayColor()
            
            sender.enabled = false
            nav.showProgress(0.1)
            nav.showMessage("Creating post")
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
                nav.showProgress(0.25)
                nav.showMessage("Uploading images")
            })
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
                nav.showProgress(0.5)
                nav.showMessage("Uploading post")
            })
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
                nav.showProgress(0.75)
                nav.showMessage("Sharing to Facebook")
            })
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
                nav.showProgress(1.0)
                nav.showMessage("Finished sharing")
            })
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
                nav.showProgress(nil)
                nav.showMessage(nil)
                sender.enabled = true
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

