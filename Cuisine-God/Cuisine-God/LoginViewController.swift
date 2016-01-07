//
//  LoginViewController.swift
//  
//
//  Created by JI LU on 12/28/15.
//
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var unameText: UITextField!
    
    @IBOutlet weak var passText: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let uname = defaults.stringForKey("uname") {
            print("logged in as \(uname)")
            self.performSegueWithIdentifier("goToHome", sender: self)
        }
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        
        
        if identifier == "goToHome" {
            let defaults = NSUserDefaults.standardUserDefaults()
            let uname = unameText.text
            let pass = passText.text
            
            let validator = InputValidation()
            
            if !validator.validateUserName(uname!) {
                callAlert("No Such UserName")
                return false
            } else if !validator.validatePass(pass!) {
                callAlert("Wrong Password")
                return false
            }
            
            let httpGETer = GET()
            let responseData = httpGETer.getMemberByUserName(uname!) as? [[String: AnyObject]]
            
            if responseData!.count == 0 {
                callAlert("No Such UserName")
                return false
            } else if let passFromDB = responseData![0]["pass"] as? String {
                if passFromDB != pass {
                    callAlert("Wrong Password")
                    return false
                } else {
                    if let id = responseData![0]["id"] as? String {
                        defaults.setObject(id, forKey: "id")
                    }
                }
            }
            
            defaults.setObject(unameText.text!, forKey: "uname")
            defaults.setObject(passText.text!, forKey: "pass")
        }
        
        
    

        
        return true
    }
    
    func callAlert(msg: String) {
        let alert = UIAlertController(title: "Invalid Input!", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction) -> Void in
            //do nothing
        }))
        
        alert.addAction(UIAlertAction(title: "Start Over", style: .Default, handler: { (action: UIAlertAction) -> Void in
            self.unameText.text = ""
            self.passText.text = ""
        }))
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToHome" {
            if let dvc = segue.destinationViewController as? UITabBarController {
                let defaults = NSUserDefaults.standardUserDefaults()
                
                
                
                
            }
        }
    }

}







