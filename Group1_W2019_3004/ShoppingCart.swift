//
//  ShoppingCart.swift
//  Group1_W2019_3004
//
//  Created by Harsh on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation


class ShoppingCart
{
    
    var cartId : Int!
    //var productId : Int!
    var dateAdded = Date()
    var items = [String : Float]()
    
    init()
    {
       
    }
    
    init(cartId : Int/*, productId : Int,dateAdded : Int */) {
        
        self.cartId = cartId
        //self.productId = productId
      //  self.dateAdded = dateAdded
    }
    
    func addCartItem(item_forCart : String , quantity : Float) throws
    {
        if( !Items.read_items.contains(where: { (item,quantity) -> Bool in
                    return item.lowercased() == item_forCart.lowercased()
        }) )
        {
                    if ( self.items.contains(where: {
                        return $0.key.lowercased() == item_forCart.lowercased()
                    }))
                    {
                        self.items[item_forCart] = self.items[item_forCart]! + quantity
                    }
        }
        else
        {
            throw CustomError.ALREADY_EXIST("\(item_forCart) already exist")
        }
    
//        print("inside add cart")
//        var Tomato = Items(item_price: 4.5, item_name: "Tomato")
//        var Onion = Items(item_price: 2.4, item_name: "Onion")
//        var Orange = Items(item_price:3.5 , item_name: "Orange")
//        var Apple = Items(item_price:4.5 , item_name: "Apple")
//        var Potato = Items(item_price: 2.1, item_name: "Potato")
//        var Banana = Items(item_price: 2.0 , item_name: "Banana")

//        if (!self.items.isEmpty )
//        {
//            for (i,q) in self.items
//            {
//
//
//                switch i.item_name
//                {
//                case "Tomato" :
//                    print("inside tom")
//                    self.items.updateValue( q+quantity , forKey: i)
//                   // self.items[item] = q+quantity
//                case "Onion" :
//                    self.items.updateValue( q+quantity , forKey: i)
//                case "Orange" :
//                    self.items.updateValue( q+quantity , forKey: i)
//                case "Apple" :
//                    self.items.updateValue( q+quantity , forKey: i)
//                case "Potato" :
//                    self.items.updateValue( q+quantity , forKey: i)
//                case "Banana" :
//                    self.items.updateValue( q+quantity , forKey: i)
//                default :
//                    self.items.updateValue( q+quantity , forKey: i)
//
//
//                }
//            }
//
//        }
//        else
//        {
//            self.items.updateValue( quantity , forKey: item )
//        }
//
//
    }
    
    
    
    
    func updateQuantity(item : String , quantity : Float)
    {
        
        for (item_forCart, _) in self.items
        {
            if(item_forCart.lowercased() == item.lowercased())
            {
                items[item_forCart] = quantity
            }
        }
        
        
        
        

    }
     func viewCartDetails() throws
     {
        if (!self.items.isEmpty)
        {
                    for (item_insideCart , quat) in self.items
                    {
                        print( "\(item_insideCart)  quantity : \(quat) " )
                    }
        }
        else
        {
            throw CustomError.EMPTY("Cart is empty")
        }

        
    }



    func checkOut()
    {
        
    }
    
    
    
    
}


