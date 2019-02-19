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
    var productId : Int!
    var productName : String!
    var quantity : Int!
    var unitCost : Float!
    var subTotal : Float!
    
    init(orderId:Int,productId:Int,productName:String,quantity:Int,unitCost:Float,subTotal:Float)
    {
        self.orderId = orderId
        self.productId = productId
        self.productName = productName
        self.quantity = quantity
        self.unitCost = unitCost
        self.subTotal = subTotal
    }
    
    func calcprice()
    {
        
    }

}
