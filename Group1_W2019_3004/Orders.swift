//
//  Orders.swift
//  Group1_W2019_3004
//
//  Created by Kiran Mehal on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation
class Orders
{
    var orderId: Int!
    var dateCreated: String!
    var dateShipped: String!
    var customerName: String!
    var customerId: String!
    var status: String!
    var shipping_info : ShippingInfo!
    var order_details : OrderDetails!
    
    
    init(orderId: Int, dateCreated: String, dateShipped: String, customerName: String, customerId: String, status: String, si : ShippingInfo, od : OrderDetails)
    {
        
        self.orderId = orderId
        self.dateCreated = dateCreated
        self.dateShipped = dateShipped
        self.customerName = customerName
        self.customerId = customerId
        self.status = status
        self.shipping_info = si
        self.order_details = od
    }
    func placeOrder()
    {
        
    }
}


