//
//  ShoppingCart.swift
//  Group1_W2019_3004
//
//  Created by Harsh on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation

// ShoppingCart not taken as struct because object of shoppingcart is stored in the constant  of customer 
class ShoppingCart
{
    
   // var cartId : Int!
    //var productId : Int!
    
    private var items = [String : Float]()
    var readItemFromCart : [String:Float]
    {
        get
        {
            return items
        }
    }
    private var checkout_counter : Bool = false
    var readonly_checkout : Bool
    {
        get
        {
            return checkout_counter
        }
    }
    
    private init()
    {
       
    }
    
    
    
     func addCartItem(item_forCart : String , quantity : Float) throws
    {
        if(!items.isEmpty)
        {
            if( Items.read_items.contains(where: { (item,quantity) -> Bool in
                return item.lowercased() == item_forCart.lowercased()
            }) )
            {
                if ( self.items.contains(where: {
                    return $0.key.lowercased() == item_forCart.lowercased()
                }))
                {
                    self.items[item_forCart] = self.items[item_forCart]! + quantity
                }
                else
                {
                    self.items.updateValue(quantity, forKey: item_forCart)
                }
            }
            else
            {
                
                throw CustomError.ALREADY_EXIST("\(item_forCart) is  invalid ")
            }
        }
        else
        {
            //print("inside else")
            if( Items.read_items.contains(where: { (item,quantity) -> Bool in
                return item.lowercased() == item_forCart.lowercased()
            }) )
            {
           //     print("inside else")
                 self.items.updateValue(quantity, forKey: item_forCart)
            }
            else
            {
                throw CustomError.ALREADY_EXIST("priduct : \(item_forCart) is invalid ")
            }
        }
        
    
    }
    
    
    
    
    func updateQuantity(item : String , quantity : Float)  throws -> String
    {
        
        for (item_forCart, _) in self.items
        {
            if(item_forCart.lowercased() == item.lowercased())
            {
                items[item_forCart] = quantity
                return "\(item) with its quantity : \(quantity) updated in database"
            }
        }
        
        throw CustomError.ALREADY_EXIST(" item does not exist with name \(item)  ")
        
        

    }
    
    
    
     func deleteItem(item : String) throws  -> String
     {
        for (item_forCart, _) in self.items
        {
            if(item_forCart.lowercased() == item.lowercased())
            {
                items.removeValue(forKey: item_forCart)
                return "\(item_forCart) successfully removed"
            }
        }
        throw CustomError.ALREADY_EXIST(" \(item) does not exist")
    }
    
    
    
    func deleteAll()
    {
        self.items.removeAll()
        self.cancelCheckOut()
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



     func checkOut() throws
     {
        if(!self.items.isEmpty)
        {
            checkout_counter = true
        }
        else
        {
            throw CustomError.EMPTY(" shopping cart is empty ")
        }
     }
    
    
    
     func  cancelCheckOut()
     {
        checkout_counter = false
     }
    
    static func getShoppingCart() -> ShoppingCart
    {
        return ShoppingCart()
    }
    
    
    
}


