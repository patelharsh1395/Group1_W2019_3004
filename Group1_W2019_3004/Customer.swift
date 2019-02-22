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
    static var cust_arr = [Customer]()
    override init()
    {
        super.init()
    }
    
    
    func addShoppingCart(sc : ShoppingCart)
    {
        shopping_cart.append(sc)
    }
    func addOrders(od : Orders)
    {
        orders.append(od)
    }
    static func register(customerName : String, address : String, email : String, creaditCardInfo : Int , shippingInfo : String, user : User ) throws -> Bool
    {
        if(!creaditCardInfo.isValidCard())
        {
            throw CustomError.INVALID("")
        }
        
        if(address == "" || address.isEmpty)
        {
            throw CustomError.INVALID("Address cannot be empty")
        }
        let cust = Customer()
        cust.userId = user.userId
        cust.password = user.password
        cust.customerName = customerName
        cust.address = address
        cust.email = user.userId
        cust.creaditCardInfo = creaditCardInfo
        cust.shippingInfo = shippingInfo
        cust.shopping_cart = []
        cust.orders = []
        
        Customer.cust_arr.append(cust)
        return true
    }
    static func login(userid: String , pass : String) throws -> Customer
    {
        var counter = 1
        for Cust in Customer.cust_arr
        {
            if(Cust.userId == userid && Cust.password == pass)
            {
                counter = 0
                return Cust
                
            }
        }
        if(counter == 1)
        {
            throw CustomError.INVALID("Invalid userid and password")
        }
        
    }
    static func updateProfile(userid : String , pass : String )
    {
        //try var cust =  Customer.login(userid: userid , pass: pass )
        
    }
}
