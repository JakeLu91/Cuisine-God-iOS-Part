//
//  IDGenerator.swift
//  Cuisine-God
//
//  Created by JAKE on 12/29/15.
//  Copyright © 2015 JI LU. All rights reserved.
//

import Foundation
import Darwin

class IDGenerator {
    
    
    //MemberID: 6-digit
    //PostID: 20-digit
    //ImageID: 18-digit
    func getID(length: Int) -> String {
        var result: String = ""
        
        for var i = 0; i < length; i++ {
            
            let digitOrCapOrLower = arc4random() % 3
            var c = "\(digitOrCapOrLower)"
            switch digitOrCapOrLower {
            case 0:
                c = "\(arc4random() % 10)"
                
            case 1:
                let order = arc4random() % 26
                
                let a:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                c = a[Int(order)]
            case 2:
                let order = arc4random() % 26
                
                let a = "abcdefghijklmnopqrstuvwxyz"
                c = a[Int(order)]
            default:break
            }
            
            result += c
        }
        
        return result
    }

}

