//
//  SignInViewController.swift
//  Carousel
//
//  Created by Corin Nader on 9/20/14.
//  Copyright (c) 2014 Corin Nader. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet weak var introTextView: UITextView!
    @IBOutlet weak var loginFormBgImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var formContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backToIntroUIButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    //Tap anywhere to dismiss keyboard
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onSignInButton(sender: UIButton) {
        
        //Prompt Loading UIAlert when onSignInButton is tapped
        var alertViewLoading = UIAlertView(title: "Loading", message: nil, delegate: self, cancelButtonTitle: nil)
        alertViewLoading.show()
        
        //Delay with LoadingUIAlert for 2 seconds
        delay(2, closure: { () -> () in
            
            //If email and pass are correct show loading alert and then move to next screen
            if (self.emailTextField.text == "me") && (self.passwordTextField.text == "pass"){
                alertViewLoading.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("signInSegue", sender: self)
            }
                
            //If email is empty show empty alert
            else if (self.emailTextField.text.isEmpty) || (self.passwordTextField.text.isEmpty){
                alertViewLoading.dismissWithClickedButtonIndex(0, animated: true)
                var alertEmpty = UIAlertView(title: "Uh-oh", message: "Your email and password can't be empty.", delegate: self, cancelButtonTitle: "OK")
                alertEmpty.show()
                
            }
            
            //Otherwise your crediential are invalid
            else {
                UIAlertView(title: "Uh-oh!", message: "You need to enter a valid email and password", delegate: self, cancelButtonTitle: "OK").show()
                alertViewLoading.dismissWithClickedButtonIndex(0, animated: true)
            }

        })
            
      }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.introTextView.alpha = 0
            self.formContainerView.frame.origin.y = -100;
            
            }, completion: nil)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.introTextView.alpha = 1
            self.formContainerView.frame.origin.y = CGFloat(self.formContainerView.tag);
            
            }, completion: nil)
    }

    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
