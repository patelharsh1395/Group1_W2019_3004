//
//  Items.swift
//  Group1_W2019_3004
//
//  Created by macos on 2019-02-21.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation

struct Items  : Hashable {
    var item_price : Float = 0.0
    var item_name : String = ""
    static var item_set = Set<String>()
    
    
    
    init?(item_price : Float , item_name : String )
    {
        if(!Items.item_exist(item: item_name))
        {
            return nil
        }
        self.item_price = item_price
        self.item_name = item_name
        Items.item_add(item: item_name)
        
    }
    
    public var hashValue: Int {
        
        return (Int(item_name.hashValue+item_price.hashValue))
        
    }
    
    public static func == (lhs : Items ,rhs : Items ) -> Bool
    {
       return (lhs.item_price == rhs.item_price ) && (lhs.item_name == rhs.item_name)
    }
    
    static func item_exist(item : String ) -> Bool
    {
        for i in item_set
        {
            if(item == i)
            {
                return true
            }
        }
        return false
    }
    static func item_add(item : String)
    {
        item_set.insert(item)
        
    }
}
