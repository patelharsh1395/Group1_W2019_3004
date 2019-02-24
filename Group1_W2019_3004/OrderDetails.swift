//
//  OrderDetails.swift
//  Group1_W2019_3004
//
//  Created by macos on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation

class OrderDetails : Orders
{
    var orderId : Int!
  //  let cust : Customer!
    
    init(orderId:Int )
    {
        self.orderId = orderId
        //self.cust = cust
    }
    
    func calcprice()
    {
        print(" orderId : \(orderId)")
        print(" shipping info : null ")
        var total : Float = 0
        var subTotal : Float = 0
        var ItemsTemp = Items.read_items
        var unitPrice : Float = 0
        for (itemFromCart,quant) in shopping_cart.readItemFromCart
        {
            for (item, price) in Items.read_items
            {
                if(item.lowercased() == itemFromCart.lowercased())
                {   unitPrice = price
                    subTotal = price*quant
                    total+=subTotal
                    break
                }
            }
            print(" Product : \(itemFromCart) , quantity : \(quant) , unitCost : \(unitPrice) , subtotal : \(subTotal) , ")
            
        }
        print("total billing amount : \(total) ")
    }

}
