//
//  RegisterViewController.swift
//  
//
//  Created by JI LU on 12/28/15.
//
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passText: UITextField!
    
    @IBOutlet weak var passConfirmText: UITextField!
    
    @IBOutlet weak var genderControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goToHome" {
            let validator = InputValidation()
            if !validator.validateUserName(userNameText.text!) {
                
                let msg = "UserName can only consisits of digit or letter"
                callAlert(msg)
                
                return false
            } else if !validator.confirmPass(passText.text!, pass2: passConfirmText.text!) {
                let msg = "Two passwords don't match"
                callAlert(msg)
                return false
            } else if !validator.validatePass(passText.text!) {
                var msg:String?
                if passText.text!.characters.count < validator.minLengthOfPassword {
                    msg = "password too short, at least 6 letters or digits"
                } else {
                    msg = "password can only consisits of digit or letter"
                }
                callAlert(msg!)
                return false
            }
            return true
        }
        return true
    }
    
    func callAlert(msg:String) {
        let alert = UIAlertController (title: "Invalid Input!", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction) -> Void in
            //do nothing
        }))
        
        alert.addAction(UIAlertAction(title: "Start Over", style: .Default, handler: { (action: UIAlertAction) -> Void in
            self.userNameText.text = ""
            self.passText.text = ""
            self.passConfirmText.text = ""
            self.genderControl.selectedSegmentIndex = 0
        }))
        
        
        presentViewController(alert, animated: true, completion: nil)
    }

  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToHome" {
            let gender:Int = genderControl.selectedSegmentIndex
            let userName = userNameText.text
            let pass = passText.text
            print("gender: \(gender)")
            print("userName: \(userName)")
            print("pass: \(pass)")
            
            
            
            /*
            if let dvc = segue.destinationViewController as? UITabBarController {
                
            }
            */
        }
    
    
    
    
    }
    

}
