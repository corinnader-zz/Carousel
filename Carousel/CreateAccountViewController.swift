//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by Corin Nader on 9/21/14.
//  Copyright (c) 2014 Corin Nader. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var lastTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var checkBoxTermsButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Register for the keyboard events
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToIntroButton(sender: UIButton) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    //Tap anywhere to dismiss keyboard
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onClickTermsButton(sender: UIButton) {
        if(checkBoxTermsButton.tag == 0){
            checkBoxTermsButton.tag = 1
            checkBoxTermsButton.selected = true
        }
        else if(checkBoxTermsButton.tag == 1){
            checkBoxTermsButton.tag = 0
            checkBoxTermsButton.selected = false
        }
    }
    
    
    
    // Do this when keyboard is showing
//    func keyboardWillHide(notification: NSNotification!) {
//        var userInfo = notification.userInfo!
//        
//        // Get the keyboard height and width from the notification
//        // Size varies depending on OS, language, orientation
//        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
//        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
//        var animationDuration = durationValue.doubleValue
//        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
//        var animationCurve = curveValue.integerValue
//        
//        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
//            
//            // Set view properties in here that you want to match with the animation of the keyboard
//            // If you need it, you can use the kbSize property above to get the keyboard width and height.
//            }, completion: nil)
//    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
