//
//  User.swift
//  LoginTest
//
//  Created by Mihail Șalari on 21.03.2016.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

class UserModel {
    
    var inputDictionary = Dictionary<String, AnyObject>()
    
    convenience init(inputDictionary: Dictionary<String, AnyObject>) {
        self.init()
        self.inputDictionary = inputDictionary
    }
    
    var username: String {
        set(newName) {
            inputDictionary["name"] = newName
        }
        get {
            return (inputDictionary["name"] as? String)!
        }
    }
    
    var password: String {
        set(newPassword) {
            inputDictionary["password"] = newPassword
        }
        get {
            return (inputDictionary["password"] as? String)!
        }
    }
    
    
}