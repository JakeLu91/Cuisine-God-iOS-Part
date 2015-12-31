//
//  PostRequestFormController.swift
//  Cuisine-God
//
//  Created by JAKE on 12/30/15.
//  Copyright © 2015 JI LU. All rights reserved.
//

import UIKit

class PostRequestFormController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
    
    
    
    @IBAction func takePhoto(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let photoPicker = UIImagePickerController()
            photoPicker.sourceType = .Camera
            photoPicker.delegate = self
            photoPicker.allowsEditing = true
            presentViewController(photoPicker, animated: true, completion: nil)
        }
        
        
    }
    
    
    @IBAction func openPhotoLibrary(sender: UIButton) {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        
        self.presentViewController(photoPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var image = info[UIImagePickerControllerEditedImage] as? UIImage
        if image == nil {
            image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        self.imageView.image = image
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
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
