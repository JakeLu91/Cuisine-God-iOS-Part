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
  
    
    @IBAction func loginPress(sender: UIButton) {
        
        
    }
    
    @IBAction func registerPress(sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToRegister" {
            if let dvc = segue.destinationViewController as? RegisterViewController {
                
            }
        } else if segue.identifier == "goToHome" {
            if let dvc = segue.destinationViewController as? UITabBarController {
                
            }
        }
    }

}







