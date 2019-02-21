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
    
    init(item_price : Float , item_name : String )
    {
        self.item_price = item_price
        self.item_name = item_name
        
    }
    
      public var hashValue: Int {
        
          //print("hash code " ,(Int(item_name.hashValue+item_price.hashValue)) )
        return (Int(item_name.hashValue+item_price.hashValue))
        
    }
    
    public static func == (lhs : Items ,rhs : Items ) -> Bool
    {
        return (lhs.item_price == rhs.item_price ) && (lhs.item_name == rhs.item_name)
    }
    
    
    
}
