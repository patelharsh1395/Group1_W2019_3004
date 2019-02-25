//
//  ShippingInfo.swift
//  Group1_W2019_3004
//
//  Created by gurminder on 2019-02-19.
//
//

import Foundation
class ShippingInfo : IDisplay
{
    
    static var counter = 0
    var shippingId: Int!
    var shippingType: ShippingType!
    var shippingRegionId: String!
    var custName : String!
    let custId :Int!
    
   
    init(custId : Int , custName : String ,  shippingType: ShippingType ,shippingRegionId: String)
    {  ShippingInfo.counter+=1
       self.custName = custName
       self.custId = custId
       self.shippingId = ShippingInfo.counter
       self.shippingType = shippingType
       self.shippingRegionId = shippingRegionId
    }
    
    
    
    func display() -> String {
        var str = ""
        str += " Shipping id : sp\(self.shippingId!) \nShippingType: \(self.shippingType!) \nShippingRegin: \(self.shippingRegionId!)  "
        
        return str
    }
    
  
}
