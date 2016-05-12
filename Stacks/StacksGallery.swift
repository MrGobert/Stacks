//
//  StacksGallery.swift
//  Stacks
//
//  Created by James Gobert on 5/9/16.
//  Copyright © 2016 Mobile First Studios. All rights reserved.
//

import UIKit

class StacksGallery: UIViewController {
    
    var accessToken: String!
    let transitionManager = TransitionManager()
    


   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         //Transparent Navigation Bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .Plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func animateSettingsViewDown() {
//        
//        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.TransitionNone, animations: {
//            
//            let offstageDown = CGAffineTransformMakeTranslation(0, 400)
//            
//            self.settingsView.transform = offstageDown
//            
//            }, completion: { finished in
//                
////                self.isSettingsUp = false
//                
//        })
//    }
//    
//    func animateSettingsViewUp() {
//        
//        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.TransitionNone, animations: {
//            
//            self.settingsView.transform = CGAffineTransformIdentity
//    
//            
//            }, completion: { finished in
//                
////                self.isSettingsUp = true
//        })
//    }
//

    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "customSegue") {
        
            // this gets a reference to the screen that we're about to transition to
            let toViewController = segue.destinationViewController as UIViewController
            
            // instead of using the default transition animation, we'll ask
            // the segue to use our custom TransitionManager object to manage the transition animation
            toViewController.transitioningDelegate = self.transitionManager
            
                        let destinationVC = (segue.destinationViewController as! MediaView)
                        destinationVC.accessToken = self.accessToken
        
        }
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
    }

    @IBAction func galleryToLikes(sender: AnyObject) {
        
        performSegueWithIdentifier("customSegue", sender: self)
    }

}
