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
    
    fileprivate static func add_item(item_name : String , price : Float) throws
    {
        if (Items.items.isEmpty)
        {
            Items.items.updateValue(price, forKey: item_name)
        }
        
        else
        {
            for (i,_) in Items.items
            {
                if(i.lowercased() != item_name.lowercased())
                {
                    //print("inside if for item update ")
                    Items.items.updateValue(price, forKey: item_name)
                }
                else
                {
                    throw CustomError.ALREADY_EXIST("\(item_name) already exist")
                }
            }
        }
    }
    
    
   
}


class Administrator : User
{
    private static var view_orders = [Orders]()
    var adminName : String!
    var email : String!
    
    init(adminName:String,email:String , user : User)
    {
        super.init(userId: user.userId, password: user.password)
        self.adminName = adminName
        self.email = email
    }

func updateCatalog(item_name : String , price : Float) -> Bool
{
    if(Items.items.contains(where: { (item,price) -> Bool in
        return item == item_name
    }))
    {
        Items.items[item_name] = price
    }
    return false
}

func add_item(item_name : String , price : Float) throws
{
    if(Items.items.contains(where: { (item,price) -> Bool in
        return item.lowercased() == item_name.lowercased()
    }))
    {
            updateCatalog(item_name: item_name, price: price)
    }
    else
    {
   try  Items.add_item(item_name: item_name, price: price)
    }
    
}
    static  func add_order(order :  Orders)    {
        Administrator.view_orders.append(order)
    
    }
    
    func display()
    {
        print("inside ")
        for ord in Administrator.view_orders {
            print("inside for")
           print( ord.order_details.cust.customerName)
        }
    }
    
    
}
