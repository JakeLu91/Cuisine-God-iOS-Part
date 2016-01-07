//
//  ProfileViewController.swift
//  Cuisine-God
//
//  Created by JAKE on 1/6/16.
//  Copyright © 2016 JI LU. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Logout" {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.removeObjectForKey("uname")
            defaults.removeObjectForKey("id")
            defaults.removeObjectForKey("pass")
        }
    }
    

}
