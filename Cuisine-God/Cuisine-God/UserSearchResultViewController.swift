//
//  UserSearchResultViewController.swift
//  Cuisine-God
//
//  Created by JAKE on 1/20/16.
//  Copyright © 2016 JI LU. All rights reserved.
//

import UIKit

class UserSearchResultViewController: UIViewController {
    
    @IBOutlet weak var unameLabel: UILabel!
   
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var signDateLabel: UILabel!
    
    @IBOutlet weak var followButton: UIButton!
    var resultInfo:[String: AnyObject] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        let uname = resultInfo["uname"]
        var gender:String?
        switch resultInfo["gender"] as! Int {
        case 0: gender = "male"
        case 1: gender = "female"
        default: break
        }
        let signDate = resultInfo["signDate"]
        
        unameLabel.text = "\(uname!)"
        genderLabel.text = "\(gender!)"
        signDateLabel.text = "signed since: \(signDate!)"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let id = defaults.valueForKey("id")
        
        let httpGet = GET()
        let following = resultInfo["id"] as! String
        let queryForFollowing = httpGet.getAFollowing("\(id!)", following: following) as? [[String: AnyObject]]
        
        if queryForFollowing?.count == 1 {
            followButton.setTitle("Unfollow and go back", forState: .Normal)
            followButton.backgroundColor = UIColor.redColor()
        } else if queryForFollowing?.count != 0 {
            print("sth went wrong!")
        }
        
        
        
    }

    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "goBack1" {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            //delete a following if there is one
            if (self.followButton.backgroundColor == UIColor.redColor()) {
                if let id = defaults.valueForKey("id") {
                    DELETE().deleteThisFollowing(id as! String, following: self.resultInfo["id"]! as! String)
                    return true
                } else {
                    return false
                }
            } else {
            //add a following if there is not one
                if let id = defaults.valueForKey("id") {
                    let dict: [String: AnyObject] = ["id": id, "following": self.resultInfo["id"]!]
                    let url = "http://localhost:8080/Cuisine-God-BackEnd/api/friends/add"
                    UploadViaJSON().upload(dict, postEndPoint: url)
                    return true
                } else {
                    return false
                }
            }
        }
        
        return true
    }
}
