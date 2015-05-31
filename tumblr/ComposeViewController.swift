//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Melissa on 5/28/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var nevermindButton: UIButton!

    var offscreenStartingPoint: CGFloat!
    var offscreenEndPoint: CGFloat!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        offscreenStartingPoint = 650 // bottom
        offscreenEndPoint = -75 // top
        
        textButton.center.y = offscreenStartingPoint
        photoButton.center.y = offscreenStartingPoint
        quoteButton.center.y = offscreenStartingPoint
        linkButton.center.y = offscreenStartingPoint
        chatButton.center.y = offscreenStartingPoint
        videoButton.center.y = offscreenStartingPoint
        nevermindButton.center.y = offscreenStartingPoint
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear (animated: Bool) {
        
        nevermindButton.alpha = 1
        textButton.alpha = 1
        photoButton.alpha = 1
        quoteButton.alpha = 1
        linkButton.alpha = 1
        chatButton.alpha = 1
        videoButton.alpha = 1
        
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                self.nevermindButton.frame.origin.y = 494
            }, completion: nil)
  
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
                self.textButton.center.y = 212
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
                self.photoButton.center.y = 212
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.06, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
                self.quoteButton.center.y = 212
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.18, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
                self.linkButton.center.y = 332
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
                self.chatButton.center.y = 332
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.22, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: nil, animations: { () -> Void in
                self.videoButton.center.y = 332
            }, completion: nil)
        
    }
    

    
    func transitionOut() {
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.nevermindButton.frame.origin.y = 650
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.textButton.center.y = self.offscreenEndPoint
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.photoButton.center.y = self.offscreenEndPoint
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.05, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.quoteButton.center.y = self.offscreenEndPoint
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.linkButton.center.y = self.offscreenEndPoint
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.15, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.chatButton.center.y = self.offscreenEndPoint
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.25, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
            self.videoButton.center.y = self.offscreenEndPoint
            }, completion: nil)
        
    }
    

    
    @IBAction func didPressNevermindButton(sender: AnyObject) {
        
        transitionOut()

        //slight delay so that icons can finish moving off screen before dismissing VC
        delay(0.3) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
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
