//
//  InsertANewMember.swift
//  Cuisine-God
//
//  Created by JAKE on 12/31/15.
//  Copyright © 2015 JI LU. All rights reserved.
//

import Foundation

class InsertANewMember {
    var memberId: String?
    
    func postANewMember(uname: String, pass: String, gender: Int) -> Int {
       
        
        //generate current date for the member
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = NSTimeZone(name: "UTC-8:00")
        let date = NSDate();
        let dateString = dateFormatter.stringFromDate(date)
        
        //generate id for the member
        //memberId is 6-digit
        let id = IDGenerator().getID(6)
        self.memberId = id
        
        let dict: [String: AnyObject] = ["id": id, "uname": uname, "pass": pass, "gender": gender, "date": dateString]
        
        
        let postEndPoint: String = "http://localhost:8080/Cuisine-God-BackEnd/api/member/add"
       
        
        return UploadViaJSON().upload(dict, postEndPoint: postEndPoint)
    }

}