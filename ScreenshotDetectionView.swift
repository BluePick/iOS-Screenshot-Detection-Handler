//
//  ScreenshotDetectionView.swift
//  Screenshot Detection
//
//  Created by Dennis Fedorko on 9/30/15.
//  Copyright © 2015 Dennis F. All rights reserved.
//

import UIKit

class ScreenshotDetectionView: UIView {
    
    private var parentViewController:UIViewController!
    private var title:String!
    private var message:String!
    private var selector:Selector!
    private var alertController:UIAlertController!
    
    init(parent:UIViewController, title:String, message:String, selector:Selector) {
        super.init(frame: parent.view.frame)
        
        //set fields
        self.parentViewController = parent
        self.title = title
        self.message = message
        self.selector = selector
        
        //initialize view items
        setUpView()
        
        //subscribe to notification that screenshot was taken
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("userDidTakeScreenshot"), name: UIApplicationUserDidTakeScreenshotNotification, object: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        //create alert view controller
        alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        //create cancel action which should just dismiss the alert
        let cancelAction = UIAlertAction(title: "No", style: .Cancel) { (action) in
            // dismiss view controller
        }
        alertController.addAction(cancelAction)
        
        //create ok action which should run the selector given to this view
        let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
            parentViewController.performSelector(selector)
        }
        alertController.addAction(okAction)

    }
    
    //MARK: -
    //MARK: Actions
    
    //executes after screenshot was detected
    func userDidTakeScreenshot() {
        parentViewController.presentViewController(alertController, animated: true, completion: nil)
    }
    

}
