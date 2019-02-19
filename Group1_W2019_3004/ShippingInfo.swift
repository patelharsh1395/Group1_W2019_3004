//
//  ShippingInfo.swift
//  Group1_W2019_3004
//
//  Created by Kiran Mehal on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation
class ShippingInfo
{
    var shippingId: Int!
    var shippingType: String!
    var shippingCost: Int!
    var shippingRegionId: Int!
    
    init(shippingId: Int,shippingType: String,shippingCost: Int,shippingRegionId: Int)
    {
       self.shippingId = shippingId
       self.shippingType = shippingType
       self.shippingCost = shippingCost
       self.shippingRegionId = shippingRegionId
    }
    
    func updateShippingInfo()
    {
        
    }
}
