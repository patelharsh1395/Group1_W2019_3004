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
    var custId : Int!
    var custName : String!
    var orderId: Int!
    var dateCreated: String!
    var dateShipped: String!
   // var cust : Customer!
    var status = OrderStatus.PROCESSING
    var shipping_info : ShippingInfo!
   
    
    let order_details : OrderDetails!
    var shoppingCartDict = [String:Float]()
    
    private init(  dateCreated: String , custId : Int , custName : String , si : ShippingInfo,  shoppingCart : [String:Float] )
    {
       
        Orders.count += 1
        self.orderId = Orders.count
        self.dateCreated = dateCreated
        self.dateShipped = ""
        self.custId = custId
        self.custName = custName
    
        self.shipping_info = si
        
       for (item, quantity) in shoppingCart
       {
        self.shoppingCartDict.updateValue(quantity, forKey: item )
        }
        
        self.order_details = OrderDetails(orderId: self.orderId, cust : cust)
    }
    static func createOrder(cust : Customer , si : ShippingInfo ) -> Orders
    {
        print(cust.customerName)
        // reference - https://www.youtube.com/watch?v=ImZWohVhSBY
        let calendar = Calendar.current
        let day = calendar.component(.day, from: Date())
        let month = calendar.component(.month, from: Date())
        let year = calendar.component(.year, from: Date())
        return Orders(dateCreated: "\(month)-\(day)-\(year)", cust : cust.customerName  , si: si,  shoppingCart: cust.shopping_cart.readItemFromCart  )
        
    }
    func placeOrder()
    {   print(self.cust.customerName)
        Administrator.add_order(order: self)
    }
    func updateStatus(order : OrderStatus)
    {
        status = order
    }
    
}


