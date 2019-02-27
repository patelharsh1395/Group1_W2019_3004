//
//  Orders.swift
//  Group1_W2019_3004
//
//  Created by gurminder on 2019-02-19.
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
    var orderItems : [String:Float]
    private var orderStatus = OrderStatus.PROCESSING
    var getOrderStatus : OrderStatus
    {
        get
        {
            return orderStatus
        }
    }
    var shippingInfo : ShippingInfo!
   
  
    
     init(  dateCreated: String ,  orderItems : [String:Float] , shippingType: ShippingType, shippingRegionId: String )
    {
       
        Orders.count += 1
        self.orderId = Orders.count
        self.dateCreated = dateCreated
        self.orderItems = orderItems
        self.shippingInfo = ShippingInfo(custId: custId, custName: custName,  shippingType: shippingType, shippingRegionId: shippingRegionId)
        
       
        
       
    }
    static func createOrder(custId : Int, custName : String , shoppingCart : [String:Float] , shippingType : ShippingType , shippingReginId : String ) -> Orders
    {
       
        // reference - https://www.youtube.com/watch?v=ImZWohVhSBY
        let calendar = Calendar.current
        let day = calendar.component(.day, from: Date())
        let month = calendar.component(.month, from: Date())
        let year = calendar.component(.year, from: Date())
        return Orders(dateCreated: "\(month)-\(day)-\(year)",  orderItems : shoppingCart , shippingType: shippingType, shippingRegionId: shippingReginId)
        
    }
    func placeOrder()
    {  

        Administrator.add_order(order: self)
    }
    func updateStatus(orderstat : OrderStatus)
    {
        self.orderStatus = orderstat
       
    }
    func calcprice()
    {
        print(" orderId : \(orderId!)")
        print(" shipping info :  ")
        print(self.shippingInfo.display())
        print(" order status : \(orderStatus)")
        var total : Float = 0
        var subTotal : Float = 0
        // let ItemsTemp = Items.read_items
        var unitPrice : Float = 0
        for (itemFromCart,quant) in self.orderItems
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
            print(" Product : \(itemFromCart) , quantity : \(quant) , unitCost : \(unitPrice.roundedVal().dollar()) , subtotal : \(subTotal.roundedVal().dollar()) , ")
            
        }
        print("total billing amount : ", total.roundedVal().dollar())
        print(" Shipping cost : ", self.shippingInfo.shippingType.rawValue)
        total += Float(self.shippingInfo.shippingType.rawValue)
        print("HST 13% tax : ", Float((total*13)/100).roundedVal().dollar())
        total += (total*13)/100
        print("final amount to be paid  : \(total.roundedVal().dollar()) ")
    }
    
}


