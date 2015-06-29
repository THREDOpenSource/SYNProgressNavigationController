//
//  SYNProgressNavigationController.swift
//  
//
//  Created by Sidhant Gandhi on 6/22/15.
//
//

import UIKit

@objc
public class SYNProgressNavigationController: UINavigationController {

    // Initialized in -viewDidLoad()
    public var progressBar: UIProgressView! = nil
    public var messageLabel: UILabel! = nil
    
    @objc
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let width = UIScreen.mainScreen().bounds.width
        
        self.navigationBar.clipsToBounds = false
        
        messageLabel = UILabel(frame: CGRect(x: 0.0, y: self.navigationBar.bounds.height, width: width, height: 30))
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.font = UIFont(name: "HelveticaNue", size: 8)
        messageLabel.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        messageLabel.textAlignment = NSTextAlignment.Center
        messageLabel.alpha = 0.0
        self.navigationBar.addSubview(messageLabel)
        
        progressBar = UIProgressView(progressViewStyle: UIProgressViewStyle.Bar)
        progressBar.frame = CGRect(x: 0.0, y: self.navigationBar.bounds.height-2, width: width, height: 2)
        progressBar.progress = 0.0
        progressBar.alpha = 0.0
        self.navigationBar.addSubview(progressBar)
    }
    
    // MARK: - Progress bar
    @objc
    public func showProgress(progress: NSNumber?) {
        
        if let progress = progress {
            fade({ self.progressBar.alpha = 1.0 })
            progressBar.setProgress(progress.floatValue, animated: true)
        } else {
            fade { self.progressBar.alpha = 0.0 }
            progressBar.setProgress(0.0, animated: true)
        }
    }
    
    @objc
    public func showMessage(message: String?) {
        if let message = message {
            messageLabel.text = message
            fade({ self.messageLabel.alpha = 1.0 })
        } else {
            messageLabel.text = ""
            fade({ self.messageLabel.alpha = 0.0 })
        }
    }
    
    func fade(block: () -> Void) {
        UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.BeginFromCurrentState, animations:block, completion: nil)
    }
}
