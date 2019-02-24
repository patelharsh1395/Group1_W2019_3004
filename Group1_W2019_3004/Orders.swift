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
    private static var count = 1
    var custid : Int!
    var orderId: Int!
    var dateCreated: String!
    var dateShipped: String!
    var cust : Customer!
    var status = OrderStatus.PROCESSING
    var shipping_info : ShippingInfo!
    var order_details : OrderDetails!
    var shoppingCart : ShoppingCart!
    
    private init(  dateCreated: String , custid : Int , si : ShippingInfo, od : OrderDetails , shoppingCart : ShoppingCart , cust : Customer)
    {
        self.custid = custid
        Orders.count += 1
        self.orderId = Orders.count
        self.dateCreated = dateCreated
        self.dateShipped = ""
        //self.customerName = customerName
    //    self.customerId = customerId
    
        self.shipping_info = si
        self.order_details = od
        self.shoppingCart = shoppingCart
        self.cust = cust
    }
    static func createOrder(customerName: String, customerId: Int , si : ShippingInfo , od : OrderDetails , shoppingCart : ShoppingCart , cust : Customer) -> Orders
    { // reference - https://www.youtube.com/watch?v=ImZWohVhSBY
        let calendar = Calendar.current
        let day = calendar.component(.day, from: Date())
        let month = calendar.component(.month, from: Date())
        let year = calendar.component(.year, from: Date())
        return Orders(dateCreated: "\(month)-\(day)-\(year)",custid :  customerId   , si: si, od: od, shoppingCart: shoppingCart, cust: cust)
    }
    func placeOrder()
    {
        Administrator.add_order(order: self)
    }
    func updateStatus(order : OrderStatus )
    {
        status = order
    }
    
}


