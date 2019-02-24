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
 
   //static var id_pass = [String : String]()
    
    
    init() {
        
    }
    
    
    
   var userId : String!
   var password : String!
   var loginStatus = LoginStatus.NOTVERIFIED
   static var users_set = Set<String>()
    

   
    
    
    
    init( password : String,  userId : String)  throws {
        if (!userId.isEmpty && !password.isEmpty)
        {
                if(userId.isValidEmail())
                {
                    if(!User.users_set.contains(userId))
                    { //  print("inside if contains")
                        if(password.isValidPassword())
                        {
                            self.userId = userId
                            self.password = password
                            User.users_set.insert(userId)
                            //print(User.users_set)
                        }
                        else
                        {
                            throw CustomError.INVALID("Password is in invalid format")
                        }
                    }
                    else
                    {  // print("inside else contains")
                        throw CustomError.ALREADY_EXIST("\(userId) already exist")
                    }

                }
                else
                {
                        throw CustomError.INVALID("UserId is in invalid format")
                }

        }
        else
        {
            throw CustomError.EMPTY("Field cannot be empty")
        }

    }
   
    
    
    init(userId : String, password : String)
    {
        self.userId = userId
        self.password = password

    }
//    static func user_exist(st : String) -> Bool
//    {
//        for i in id_pass
//        {
//            if(st == i)
//            {
//                return true
//            }
//        }
//        return false
//    }
//    static func user_append(st : String)
//    {
//        users_set.insert(st)
//    }
//    func verifyLogin() -> Bool
//    {
//        if(self.loginStatus == LoginStatus.NOTVERIFIED)
//        {
//            return false
//        }
//        else
//        {
//            return true
//        }
//    }
//    func verify () {
//        loginStatus = LoginStatus.VERIFIED
//    }
//
    
}
