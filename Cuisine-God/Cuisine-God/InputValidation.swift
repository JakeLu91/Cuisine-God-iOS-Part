//
//  InputValidation.swift
//  Cuisine-God
//
//  Created by JAKE on 12/29/15.
//  Copyright © 2015 JI LU. All rights reserved.
//

import Foundation

class InputValidation {
    
    let minLengthOfPassword = 6
    let DIGIT_AND_LETTER:String = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    
    func validateUserName(userName: String) -> Bool {
        if userName.characters.count == 0 {
            return false
        }
        
        for var i = 0; i < userName.characters.count; i++ {
            if !isDigitOrLetter(userName[i]) {
                return false
            }
        }
        return true
    }
    
    func validatePass(pass: String) -> Bool {
        if pass.characters.count < minLengthOfPassword {
            return false
        }
        for var i = 0; i < pass.characters.count; i++ {
            if !isDigitOrLetter(pass[i]) {
                return false
            }
        }
        return true
    }
    
    func confirmPass(pass1: String, pass2: String) -> Bool {
        if pass1 == pass2 {
            return true
        } else {
            return false
        }
    }
    
    
    func isDigitOrLetter(c: Character) -> Bool {
        for var i = 0; i < DIGIT_AND_LETTER.characters.count; i++ {
            if c == DIGIT_AND_LETTER[i] {
                return true
            }
        }
        return false

    }
    
    
}


extension String {
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
}