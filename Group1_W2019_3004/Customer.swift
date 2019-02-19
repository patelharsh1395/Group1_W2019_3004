//
//  Customer.swift
//  Group1_W2019_3004
//
//  Created by Harsh on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation



class Customer : User
{
    var customerName : String!
    var address : String!
    var email : String!
    var creaditCardInfo : String!
    var shippingInfo : String!
    var shopping_cart : [ShoppingCart]!
    var orders : [Orders]!
    override init()
    {
        super.init()
    }
    
    init(customerName : String, address : String, email : String, creaditCardInfo : String , shippingInfo : String, userId: String, password: String, loginStatus: Bool  ) {
        super.init(userId: userId, password: password, loginStatus: loginStatus)!
        self.customerName = customerName
        self.address = address
        self.email = email
        self.creaditCardInfo = creaditCardInfo
        self.shippingInfo = shippingInfo
        shopping_cart = []
        orders = []
    }
    func addShoppingCart(sc : ShoppingCart)
    {
        shopping_cart.append(sc)
    }
    func addOrders(od : Orders)
    {
        orders.append(od)
    }
    func register()
    {
        
    }
    func login()
    {
        
    }
    func updateProfile()
    {
        
    }
}
