//
//  OrderDetails.swift
//  Group1_W2019_3004
//
//  Created by Sushmitha on 2019-02-19.


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
        print(self.shippingInfo.display())
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
