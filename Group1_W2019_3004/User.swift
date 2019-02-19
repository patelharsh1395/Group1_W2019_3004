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
    var loginStatus : String!
    
    
    init(userId : String, password : String, loginStatus : String)
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
