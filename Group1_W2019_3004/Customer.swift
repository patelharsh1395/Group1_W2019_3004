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
    var creaditCardInfo : Int!
    var shippingInfo : String!
    var shopping_cart : [ShoppingCart]!
    var orders : [Orders]!
    override init()
    {
        super.init()
    }
    
    init?(customerName : String, address : String, email : String, creaditCardInfo : Int , shippingInfo : String, user : User  ) {
        
        if(!creaditCardInfo.isValidCard())
        {
            return nil
        }
        
        if(address == "")
        {
            return nil
        }
        
        super.init(userId: user.userId, password: user.password)
        self.customerName = customerName
        self.address = address
        self.email = user.userId
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
    static func register(customerName : String, address : String, email : String, creaditCardInfo : Int , shippingInfo : String, user : User ) throws -> Customer
    {
        if(!creaditCardInfo.isValidCard())
        {
            throw CustomError.INVALID("")
        }
        
        if(address == "" || address.isEmpty)
        {
            throw CustomError.INVALID("Address cannot be empty")
        }
        var cust = Customer()
        cust.userId = user.userId
        cust.password = user.password
        cust.customerName = customerName
        cust.address = address
        cust.email = user.userId
        cust.creaditCardInfo = creaditCardInfo
        cust.shippingInfo = shippingInfo
        cust.shopping_cart = []
        cust.orders = []
        
        return cust
    }
    func login()
    {
        
    }
    func updateProfile()
    {
        
    }
}
