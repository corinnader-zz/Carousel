//
//  SignInViewController.swift
//  Carousel
//
//  Created by Corin Nader on 9/20/14.
//  Copyright (c) 2014 Corin Nader. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingActivityView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        loadingActivityView.startAnimating()
        if(emailTextField.text == "me") && (passwordTextField.text == "pass") {
            
            delay(2, closure: { () -> () in
                self.performSegueWithIdentifier("signInSegue", sender: self)
            })
 
        } else{
            
            delay(2, closure: { () -> () in
                var alertView = UIAlertView(title: "Nope", message: "Your email and password suck. Try again.", delegate: self, cancelButtonTitle: "OK")
                alertView.show()
                self.loadingActivityView.stopAnimating()
                
            })
        }
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
