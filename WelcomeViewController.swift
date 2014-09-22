//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Corin Nader on 9/21/14.
//  Copyright (c) 2014 Corin Nader. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var takeCarouselButton: UIButton!
    @IBOutlet weak var backupSwitch: UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set scroll view delegate to self
        scrollView.delegate = self
        
        //Set scrollview content size
        scrollView.contentSize = CGSize(width: 1280, height: 320)
        
        takeCarouselButton.alpha = 0
        self.backupSwitch.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        //Set the current page, so the dots will animate
        pageControl.currentPage = page
        
        //If it's the 3rd page, animate the alpha transparency to 1
        if page == 3{
            UIView.animateWithDuration(0.3) {
                self.takeCarouselButton.alpha = 1
                self.backupSwitch.alpha = 1
            }
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
