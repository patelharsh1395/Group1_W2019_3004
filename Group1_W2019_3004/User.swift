//
//  User.swift
//  Group1_W2019_3004
//
//  Created by Harsh on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation




class User : IDisplay
{
    
 
   //static var id_pass = [String : String]()
    
    
    init() {
        
    }
    
    
    
   var userId : String!
   var password : String!
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
    func display() -> String {
        if(!User.users_set.isEmpty)
        {
                var stTemp = " "
                for ur  in User.users_set
                {
                    stTemp += "\(ur)\n"
                }
                return stTemp
        }
        else
        {
            return "no user created"
        }
    }
    
    
}
