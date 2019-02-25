//
//  OrderDetails.swift
//  Group1_W2019_3004
//
//  Created by macos on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation

class OrderDetails
{
    var orderId : Int!
    var shoppingCart = [String:Float]()
    var order_status : OrderStatus!
    var shippingInfo : ShippingInfo!
   //  let cust : Customer!
    
    init(oId:Int , shoppingCart : [String:Float], order_status :  OrderStatus , shippingInfo : ShippingInfo)
    {
        self.orderId = oId
        self.shoppingCart = shoppingCart
        self.order_status = order_status
        self.shippingInfo = shippingInfo
    }
    func updateStatus(order : OrderStatus)
    {
        self.order_status = order
        
    }
    func calcprice()
    {
        print(" orderId : \(orderId!)")
        print(" shipping info :  ")
        self.shippingInfo.display()
        print("")
        print(" order status : \(order_status!)")
        var total : Float = 0
        var subTotal : Float = 0
        var ItemsTemp = Items.read_items
        var unitPrice : Float = 0
        for (itemFromCart,quant) in self.shoppingCart
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
        print("total billing amount : ", total)
        print(" Shipping cost : ", self.shippingInfo.shippingType.rawValue)
        total += Float(self.shippingInfo.shippingType.rawValue)
        print("total billing amount : \(total) ")
    }

}
