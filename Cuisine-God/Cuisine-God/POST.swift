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
                            
                            
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = NSDate();
        let dateString = dateFormatter.stringFromDate(date)
                            
        let dict = ["id": "test", "uname": "test", "pass": "test", "gender": 0, "date": dateString]
        let data = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions(0), error: nil)
        
        let jsonText = NSString(data: data!, encoding: NSASCIIStringEncoding)
        
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http:localhost:8080/Cuisine-God-BackEnd/api/member/add")!)
        request.HTTPMethod = "POST"
        request.setValue("application/json, charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = data
        
        
        
        
        return 200
    }
    
}
