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
    var productId : Int!
    var quantity : Int!
    var dateAdded : Int!
    
    
    
    init(cartId : Int, productId : Int, quantity : Int , dateAdded : Int ) {
        self.cartId = cartId
        self.productId = productId
        self.quantity = quantity
        self.dateAdded = dateAdded
    }
    
    func addCartItem()
    {
        
    }
    func updateQuantity()   {
        
        
    }
     func viewCartDetails()
     {
        
    }
    func checkOut()
    {
        
    }
}
