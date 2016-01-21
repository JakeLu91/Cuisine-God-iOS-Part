//
//  UploadViaJSON.swift
//  Cuisine-God
//
//  Created by JAKE on 1/20/16.
//  Copyright © 2016 JI LU. All rights reserved.
//

import Foundation

class UploadViaJSON {
    
    func upload(dict: [String: AnyObject], postEndPoint: String) -> Int {
        var http_code = 200
        
        let url = NSURL(string: postEndPoint)!
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        var jData:NSData? = nil
        do {
            jData = try NSJSONSerialization.dataWithJSONObject(dict, options: .PrettyPrinted)
            request.HTTPBody = jData
            
        } catch {
            print("FUCK YOU MOTHER FUCKING SHIT!")
        }
        
        //print(NSString(data: jData!, encoding: NSASCIIStringEncoding)!)
        
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
    
    
}