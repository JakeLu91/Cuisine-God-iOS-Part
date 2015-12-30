//
//  POST.swift
//  Cuisine-God
//
//  Created by JI LU on 12/29/15.
//  Copyright (c) 2015 JI LU. All rights reserved.
//

import Foundation
import AVFoundation

class POST {
    
    
    func postANewMember(uname: String, pass: String, gender: Int) -> Int {
        
        var http_code = 200
                            
        //generate current date for the member
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = NSDate();
        let dateString = dateFormatter.stringFromDate(date)
        
        //generate id for the member
        let id = IDGenerator().memberID()
                            
        let dict: [String: AnyObject] = ["id": id, "uname": uname, "pass": pass, "gender": gender, "date": dateString]
        
        
        let postEndPoint: String = "http://localhost:8080/Cuisine-God-BackEnd/api/member/add"
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
