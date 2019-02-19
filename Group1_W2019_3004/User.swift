//
//  User.swift
//  Group1_W2019_3004
//
//  Created by Harsh on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation


class User
{
 
    var userId : String!
    var password : String!
    var loginStatus : Bool!
    
    
    init() {
        
    }
    
    init?(userId : String, password : String, loginStatus : Bool)
    {
        self.userId = userId
        self.password = password
        self.loginStatus = loginStatus
        
        
        
    }
    
    func verifyLogin() -> Bool
    {
        return true
    }
}
