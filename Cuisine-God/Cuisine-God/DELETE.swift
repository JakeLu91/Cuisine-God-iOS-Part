//
//  DELETE.swift
//  Cuisine-God
//
//  Created by JAKE on 1/21/16.
//  Copyright © 2016 JI LU. All rights reserved.
//

import Foundation

class DELETE {
    
    func deleteThisFollowing(id:String, following: String) -> Int {
        let deleteEndPoint: String = "http://localhost:8080/Cuisine-God-BackEnd/api/friends/delete"
        
        
        let dict:[String: AnyObject] = ["id": id, "following": following]
        
        
        return deleteViaJSON(dict, deleteEndPoint: deleteEndPoint)
        
    }
    
    
    func deleteViaJSON(dict: [String: AnyObject], deleteEndPoint: String) -> Int {
        var http_code = 200
        
        let url = NSURL(string: deleteEndPoint)!
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "DELETE"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        var jData:NSData? = nil
        do {
            jData = try NSJSONSerialization.dataWithJSONObject(dict, options: .PrettyPrinted)
            request.HTTPBody = jData
            
        } catch {
            print("FUCK YOU MOTHER FUCKING SHIT!")
        }
      
        
        let session = NSURLSession.sharedSession()
        session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            
            
            guard let realResponse = response as? NSHTTPURLResponse? where realResponse!.statusCode == 200 else {
                http_code = 404
                print("not 200 response")
                return
            }
            
            if let deleteString = NSString(data: data!, encoding: NSUTF8StringEncoding) as? String {
                print("DELETE: " + deleteString)
            }
        }).resume()
        
        
        return http_code
        
    }
        
        
        
        
        
        
        
        
        
        
        
}