//
//  ViewController.swift
//  Self Dismissing Timer
//
//  Created by Dion Pettaway on 11/30/15.
//  Copyright © 2015 Dipet_Low. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dismissTimer: NSTimeInterval = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        showAlertError("Bless", msg: "Americans")
    }
    
    func showAlertError(title: String, msg: String) {
        let ac = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let okayAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        ac.addAction(okayAction)
        ac.addAction(cancelAction)
        
        dispatch_async(dispatch_get_main_queue(), {
            self.presentViewController(ac, animated: true, completion: nil)
        })
        
        _ = NSTimer.scheduledTimerWithTimeInterval(dismissTimer, target: self, selector: "dismissAlert", userInfo: nil, repeats: false)
    }
    
    func dismissAlert() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

