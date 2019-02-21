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
    var loginStatus = LoginStatus.NOTVERIFIED
    static var users_set = Set<String>()
    
    init() {
        
    }
    init?( password : String,  userId : String) {
        if (!userId.isEmpty && !password.isEmpty)
        {
                if(userId.isValidEmail())
                {
                    if(password.isValidPassword())
                    {
                        if(User.user_exist(st: userId))
                        {
                            print("user already exist")
                            return nil
                        
                        }
                        else
                        {
                            User.user_append(st: userId)
                            self.userId = userId
                            self.password = password
                        }
                    }
                    else
                    {
                        print("password : invalid format ")
                        return nil
                    }
                
                }
                else
                {
                        print("userid : invalid email format")
                        return nil
                }
            
        }
        else
        {
            print("userid and password  :  can't be empty ")
            return nil
        }
        
    }
    init(userId : String, password : String)
    {
        self.userId = userId
        self.password = password
        
    }
    static func user_exist(st : String) -> Bool
    {
        for i in users_set
        {
            if(st == i)
            {
                return true
            }
        }
        return false
    }
    static func user_append(st : String)
    {
        users_set.insert(st)
    }
    func verifyLogin() -> Bool
    {
        if(self.loginStatus == LoginStatus.NOTVERIFIED)
        {
            return false
        }
        else
        {
            return true
        }
    }
    func verify () {
        loginStatus = LoginStatus.VERIFIED
    }
    
    
}
