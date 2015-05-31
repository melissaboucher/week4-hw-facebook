//
//  SearchViewController.swift
//  tumblr
//
//  Created by Melissa on 5/28/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    
    @IBOutlet weak var loadingDotsImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 320, height: 1217)

        feedImage.hidden = true
        
        // loads a series of static images into an animated UIImage array using the filename prefix, appends 0 or 1 to look for first image in animation sequence
        var images = UIImage.animatedImageNamed("loading-", duration: 0.5)
        loadingDotsImage.image = images
        
        delay(1.5, { () -> () in
            self.loadingDotsImage.stopAnimating()
            self.feedImage.hidden = false
            self.loadingDotsImage.hidden = true
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
