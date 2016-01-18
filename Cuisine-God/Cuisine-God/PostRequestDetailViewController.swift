//
//  PostRequestDetailViewController.swift
//  Cuisine-God
//
//  Created by JAKE on 12/30/15.
//  Copyright © 2015 JI LU. All rights reserved.
//

import UIKit

class PostRequestDetailViewController: UIViewController {
    
    
    @IBOutlet weak var foodNameText: UITextField!
    
    
    @IBOutlet weak var ingredientsText: UITextField!
    
    
    @IBOutlet weak var cookingTimeText: UITextField!
    
    @IBOutlet weak var selfRateSegment: UISegmentedControl!
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .ScaleAspectFit
        }
    }
    
    var image:UIImage?
    
    @IBAction func postAPost(sender: UIButton) {
        
        let validator = InputValidation()
        
        let name = foodNameText.text
        let ingredient = ingredientsText.text
        let cookingTime = cookingTimeText.text
        
        
        if !validator.validateText(name!) {
            callAlert("Invalid symbol included in your Food Name!")
        } else if !validator.validateText(ingredient!) {
            callAlert("Invalid symbol included in your Ingredients")
        } else if !validator.validateDoubleInput(cookingTime!) {
            callAlert("Invalid cooking time")
        }
        
    
        let selfRate = selfRateSegment.selectedSegmentIndex
        
        //generate timestamp
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC-8:00")
        dateFormatter.dateFormat = "yyyy-MM-dd_HH-mm-ss"
        let date = NSDate();
        let timeString = dateFormatter.stringFromDate(date)
        
        
        let id = IDGenerator().getID(20)
        print(id)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let userID = defaults.stringForKey("id")
        let userName = defaults.stringForKey("uname")
        
        
        UploadAnImage().uploadANewImage(image!, name: "\(userName!)")
        
        
    }
    
    
    
    func callAlert(msg: String) {
        let alert = UIAlertController(title: "Invalid Input!", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction) -> Void in
            //do nothing
        }))
        
        alert.addAction(UIAlertAction(title: "Start Over", style: .Default, handler: { (action: UIAlertAction) -> Void in
            self.foodNameText.text = ""
            self.ingredientsText.text = ""
            self.cookingTimeText.text = ""
            self.selfRateSegment.selectedSegmentIndex = 0
        }))
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        
    }

   


}
