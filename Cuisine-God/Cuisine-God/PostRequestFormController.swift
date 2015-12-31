//
//  PostRequestFormController.swift
//  Cuisine-God
//
//  Created by JAKE on 12/30/15.
//  Copyright © 2015 JI LU. All rights reserved.
//

import UIKit

class PostRequestFormController: UIViewController {
    
    var imageURL:NSURL?
    
   
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .ScaleAspectFit
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageURL = NSURL(string: "http://cs193p.stanford.edu/Images/Panorama.jpg")
        updateImage()
        
    }
    
    
    func updateImage() {
        if let url = self.imageURL {
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            dispatch_async(dispatch_get_global_queue(qos, 0)) { [weak self] in
                if let imageData = NSData(contentsOfURL: url) {
                    if url == self?.imageURL {
                        if let image = UIImage(data: imageData) {
                            dispatch_async(dispatch_get_main_queue()) {
                                self?.imageView.image = image
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}
