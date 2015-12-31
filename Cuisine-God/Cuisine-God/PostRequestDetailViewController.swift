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
        
        
        let name = foodNameText.text
        let ingredient = ingredientsText.text
        let cookingTime = cookingTimeText.text
        
        UploadAnImage().uploadANewImage(image!, name: "test")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        
        // Do any additional setup after loading the view.
    }

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
