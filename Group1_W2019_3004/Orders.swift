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
    private static var count = 0
    var custId : Int!
    var custName : String!
    let orderId: Int!
    var dateCreated: String!
    var dateShipped: String!
    private var status = OrderStatus.PROCESSING
    var shipping_info : ShippingInfo!
   let order_details : OrderDetails!
  
    
    private init(  dateCreated: String , custId : Int , custName : String , shoppingCart : [String:Float] , shippingType: ShippingType, shippingRegionId: String )
    {
       
        Orders.count += 1
        self.orderId = Orders.count
        self.dateCreated = dateCreated
        self.dateShipped = ""
        self.custId = custId
        self.custName = custName
    
        self.shipping_info = ShippingInfo(custId: custId, custName: custName,  shippingType: shippingType, shippingRegionId: shippingRegionId)
        
       
        
        self.order_details = OrderDetails(oId : self.orderId , shoppingCart:  shoppingCart , order_status : self.status , shippingInfo : self.shipping_info)
    }
    static func createOrder(custId : Int, custName : String , shoppingCart : [String:Float] , shippingType : ShippingType , shippingReginId : String ) -> Orders
    {
       
        // reference - https://www.youtube.com/watch?v=ImZWohVhSBY
        let calendar = Calendar.current
        let day = calendar.component(.day, from: Date())
        let month = calendar.component(.month, from: Date())
        let year = calendar.component(.year, from: Date())
        return Orders(dateCreated: "\(month)-\(day)-\(year)", custId : custId, custName : custName ,   shoppingCart: shoppingCart ,shippingType: shippingType, shippingRegionId: shippingReginId )
        
    }
    func placeOrder()
    {  

        Administrator.add_order(order: self)
    }
    func updateStatus(orderstat : OrderStatus)
    {
        self.status = orderstat
        self.order_details.updateStatus(order: orderstat)
    }
    
}


