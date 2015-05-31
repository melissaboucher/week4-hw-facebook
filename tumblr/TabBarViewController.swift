//
//  TabBarViewController.swift
//  tumblr
//
//  Created by Melissa on 5/26/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var buttonArray: [UIButton]!
    var previousButtonIndex: Int!
    var selectedButtonIndex: Int!
    
    var viewControllerArray = [UIViewController]()
    
    @IBOutlet weak var explorePopup: UIImageView!
    
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
//    var composeViewControllre: ComposeViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add instances of each controller using Storyboard ID, to be pulled into the TabBarViewController
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! SearchViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! TrendingViewController

        buttonArray = [homeButton, searchButton, accountButton, trendingButton]
        viewControllerArray = [homeViewController, searchViewController, accountViewController, trendingViewController]
        

        // show homeViewController as the default on load
        previousButtonIndex = 0
        selectedButtonIndex = 0
        didPressTabButton(selectedButtonIndex)
        
        animateExplorePopup()
    }

    
    func animateExplorePopup() {
        UIView.animateWithDuration(0.7, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut | UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.explorePopup.center.y = 500
        }, completion: nil)

    }
    
    func removeChildView (content: UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    
    func didPressTabButton(selectedItem: Int!)
    {
        // remove existing view before adding a new view.
        removeChildView(viewControllerArray[previousButtonIndex])
        buttonArray[previousButtonIndex].selected = false
        
        // set selected button index to the newly selected view
        selectedButtonIndex = selectedItem
        
        // add in the new view
        buttonArray[selectedButtonIndex].selected = true
        addChildViewController(viewControllerArray[selectedButtonIndex])
        var selectedContentView = viewControllerArray[selectedButtonIndex].view
        selectedContentView.frame = contentView.frame
        contentView.addSubview(selectedContentView)
        
         // tracks that we added the content
        viewControllerArray[selectedButtonIndex].didMoveToParentViewController(self)
        
        if (selectedButtonIndex == 1) {
            explorePopup.hidden = true
        }
        else {
            explorePopup.hidden = false
        }
        
        // track the recently selected button and stores in previousButtonIndex
        previousButtonIndex = selectedButtonIndex
        
    }
    
    @IBAction func didPressHomeButton(sender: AnyObject) {
        selectedButtonIndex = 0
        didPressTabButton(selectedButtonIndex)
    }
    
    @IBAction func didPressSearchButton(sender: AnyObject) {
        selectedButtonIndex = 1
        didPressTabButton(selectedButtonIndex)

    }
    
    @IBAction func didPressAccountButton(sender: AnyObject) {
        selectedButtonIndex = 2
        didPressTabButton(selectedButtonIndex)

    }
    
    @IBAction func didPressTrendingButton(sender: AnyObject) {
        selectedButtonIndex = 3
        didPressTabButton(selectedButtonIndex)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
