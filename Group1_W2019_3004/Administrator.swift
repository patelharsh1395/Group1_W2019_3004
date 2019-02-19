//
//  Administrator.swift
//  Group1_W2019_3004
//
//  Created by macos on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation

class Administrator
{

var adminName : String!
var email : String!
    
    init(adminName:String,email:String)
    {
        self.adminName = adminName
        self.email = email
        
    }

func updateCatalog() -> Bool
{
    return true
}

}
