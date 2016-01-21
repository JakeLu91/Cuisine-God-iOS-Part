//
//  DiscoverViewController.swift
//  Cuisine-God
//
//  Created by JAKE on 1/20/16.
//  Copyright © 2016 JI LU. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    var resultInfo:[String: AnyObject] = [:]
    
    @IBOutlet weak var searchText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        if identifier == "goToResult" {
            let uname = searchText.text
            
            if !InputValidation().validateUserName(uname!) {
                callAlert("Invalid UnserName!")
            } else {
                let httpGETer = GET()
                let responseData = httpGETer.getMemberByUserName(uname!) as? [[String: AnyObject]]
                
                if responseData!.count == 0 {
                    callAlert("No Such UserName")
                    return false
                } else {
                    self.resultInfo = responseData![0]
                    return true
                }
            }
        }
        
        return true
    }
   
    
    func callAlert(msg: String) {
        let alert = UIAlertController(title: "Invalid Input!", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction) -> Void in
            //do nothing
        }))
        
        alert.addAction(UIAlertAction(title: "Start Over", style: .Default, handler: { (action: UIAlertAction) -> Void in
            self.searchText.text = ""
        }))
        presentViewController(alert, animated: true, completion: nil)
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToResult" {
            if let dvc = segue.destinationViewController as? UserSearchResultViewController {
                dvc.resultInfo = self.resultInfo
            }
        }
    }


}
