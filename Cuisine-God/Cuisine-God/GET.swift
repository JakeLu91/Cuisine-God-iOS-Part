//
//  GET.swift
//  Cuisine-God
//
//  Created by JAKE on 12/30/15.
//  Copyright © 2015 JI LU. All rights reserved.
//

import Foundation


class GET {
    
    func getMemberByUserName(uname: String) -> NSArray {

        let postEndPoint: String = "http://localhost:8080/Cuisine-God-BackEnd/api/member/getMemberByUname?uname=\(uname)"
        let url = NSURL(string: postEndPoint)!
        
        
        
        let jData:NSData? = NSData(contentsOfURL: url)
        var data = []
        
        do {
            data = try NSJSONSerialization.JSONObjectWithData(jData!, options: .AllowFragments) as! [[String: AnyObject]]
        }catch {
            print("shit!")
        }
        
        return data
    }
    
    
   
    
    
}