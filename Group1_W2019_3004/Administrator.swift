//
//  Administrator.swift
//  Group1_W2019_3004
//
//  Created by macos on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation


struct Items {
   
    
    fileprivate static  var items = [String:Float]()
    
    
    
    
    static var read_items : [String:Float]
    {
        get
        {
            return Items.items
        }
    }
    
    fileprivate static func add_item(item_name : String , price : Float ) throws
    {
        for (i,_) in Items.items
        {
            if(i.lowercased() != item_name.lowercased())
            {
                Items.items.updateValue(price, forKey: item_name)
            }
            else
            {
                throw CustomError.ALREADY_EXIST("\(item_name) already exist")
            }
        }
    }
    
    
   
}


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

func add_item(item_name : String , price : Float) throws
{
    
   try  Items.add_item(item_name: item_name, price: price)
}
    
    
}
