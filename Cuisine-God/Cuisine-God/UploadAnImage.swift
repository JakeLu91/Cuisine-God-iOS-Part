//
//  UploadAnImage.swift
//  Cuisine-God
//
//  Created by JAKE on 12/31/15.
//  Copyright © 2015 JI LU. All rights reserved.
//

import Foundation
import UIKit
class UploadAnImage {
    
    func uploadANewImage(image: UIImage) -> Int {
        var http_code = 200
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC-8:00")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        //generate timestamp
        let date = NSDate();
        let timeString = dateFormatter.stringFromDate(date)
        print("\(timeString)")
        
        //generate current date for the member
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.stringFromDate(date)
        
        
        let url = NSURL(string: "http://localhost:8080/Cuisine-God-BackEnd/api/image/store")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        let param = ["date": "\(dateString)", "time": "\(timeString)", "userName": "test"]
        
        let boundary = generateBoundaryString()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("keep-alive", forHTTPHeaderField: "Connection")
        
        let imageData = UIImageJPEGRepresentation(image, 1)
        if imageData == nil {
            http_code = 400
            return http_code
        }
        request.HTTPBody = createBodyWithParameters(param, filePathKey: "file", imageDataKey: imageData!, boundary: boundary)
        
        
        
        let session = NSURLSession.sharedSession()
        session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            
            
            guard let realResponse = response as? NSHTTPURLResponse? where realResponse!.statusCode == 200 else {
                http_code = 404
                print("not 200 response")
                return
            }
            
            if let postString = NSString(data: data!, encoding: NSUTF8StringEncoding) as? String {
                print("POST: " + postString)
            }
        }).resume()
        
        
        return http_code
        
    }
    
    //this method is copied from http://swiftdeveloperblog.com/image-upload-example/
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        let body = NSMutableData();
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        let filename = "us.jpg"
        
        let mimetype = "image/jpg"
        
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimetype)\r\n\r\n")
        body.appendData(imageDataKey)
        body.appendString("\r\n")
        
        
        
        body.appendString("--\(boundary)--\r\n")
        
        return body
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().UUIDString)"
    }
    
}

extension NSMutableData {
    func appendString(string: String) {
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        appendData(data!)
    }
    
    
}