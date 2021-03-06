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
    static var counter = 0
    let custid : Int!
    var customerName : String!
    var address : String!
    var creaditCardInfo : Int!
    var current_add_id = 0
    let shopping_cart = ShoppingCart.getShoppingCart()
    var orders : [Orders]!
    static var usersDictionary = [String:(String,Customer)]()
    
    
    
    override private init()
    {
        Customer.counter+=1
        self.custid = Customer.counter
        super.init()
    }
    
    
    
    func addOrders(od : Orders)
    {
        orders.append(od)
    }
    
    
    
    
    static func register(customerName : String, address : String,  creaditCardInfo : Int , userId : String , password : String ) throws -> Bool
    {
        
        if (!userId.isEmpty && !password.isEmpty && !customerName.isEmpty && !address.isEmpty  )
        {
                        if(userId.isValidEmail())
                        {
                                            if(Customer.usersDictionary.isEmpty)
                                            {
                                                
                                                
                                                                    if(password.isValidPassword())
                                                                    {
                                                                        
                                                                       
                                                                        
                                                                                            if(!creaditCardInfo.isValidCard())
                                                                                            {
                                                                                                throw CustomError.INVALID(" Invalid credit card ")
                                                                                            }
                                                                                            let cust = Customer()
                                                                                            cust.customerName = customerName
                                                                                            cust.address = address
                                                                                            cust.creaditCardInfo = creaditCardInfo
                                                                                            cust.orders = []
                                                                                            Customer.usersDictionary.updateValue((password,cust), forKey: userId)
                                                                        
                                                                    }
                                                                    else
                                                                    {
                                                                        throw CustomError.INVALID("Password is in invalid format")
                                                                    }
                                                
                                            }
                                            else
                                            {
                                                                    if let _ = Customer.usersDictionary[userId]
                                                                    {
                                                                        throw CustomError.ALREADY_EXIST("\(userId) already exist")
                                                                    }
                                                                    else
                                                                    {
                                                                        
                                                                        
                                                                                            if(password.isValidPassword())
                                                                                            {
                                                                                                
                                                                                                if(!creaditCardInfo.isValidCard())
                                                                                                {
                                                                                                    throw CustomError.INVALID(" Invalid credit card ")
                                                                                                }
                                                                                                let cust = Customer()
                                                                                                cust.customerName = customerName
                                                                                                cust.address = address
                                                                                                cust.creaditCardInfo = creaditCardInfo
                                                                                                cust.orders = []
                                                                                                Customer.usersDictionary.updateValue((password,cust), forKey: userId)
                                                                                                
                                                                                                
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                throw CustomError.INVALID("Password is in invalid format")
                                                                                            }
                                                                    }
                                            }
                        }
                        else
                        {
                            throw CustomError.INVALID("UserId is in invalid format")
                        }
            
        }
        else
        {
            throw CustomError.EMPTY("Field cannot be empty")
        }
        return true
    }
    
    
  
    
    static func login(userid: String , pass : String) throws -> Customer
    {
        var cust : Customer!
        if let _ = Customer.usersDictionary[userid]
        {
            if(Customer.usersDictionary[userid]!.0 == pass)
            {
                 cust = Customer.usersDictionary[userid]!.1
            }
            else
            {
                throw CustomError.INVALID("password invalid")
            }
        }
        else
        {
            throw CustomError.INVALID("UserID and password are invalid")
        }
        return cust
    }
    
    
    
    func placeOrder(shippingType: ShippingType, shippingRegionId: String ) throws
    {
        if(self.shopping_cart.readonly_checkout)
        {
                let orderTemp =  Orders.createOrder(custId: self.custid , custName: self.customerName, shoppingCart:  self.shopping_cart.readItemFromCart, shippingType: shippingType , shippingReginId: shippingRegionId )
              print("order created sucessfully ")
                self.orders.append(orderTemp)
                orderTemp.placeOrder()
                self.shopping_cart.removeAll()
        }
        else
        {
            throw CustomError.INVALID("Need to checkout from shopping cart")
        }
    }

    
    
    func display() -> String {
        var str = ""
        if(!self.orders.isEmpty)
        {
                for  ord in self.orders
                {
                    ord.calcprice()
                }
        }
        else
        {
            str += "\(self.userId!) , \(self.customerName!) has no order history"
        }
        return str
    }
    
    
    func addItemToShoppingCart(item : String , qty : Float) throws
    {
        try self.shopping_cart.addCartItem(item_forCart: item, quantity: qty)
    }
    func removeItemFromShoppingCart(item : String) throws
    {
        print("item removed sucessfully = ",try self.shopping_cart.removeItem(item: item))
    }
    func checkout() throws
    {
       try self.shopping_cart.checkOut()
    }
    func cancelCheckout()  {
        self.shopping_cart.cancelCheckOut()
    }
    func  updateQuantity (itemFromCart : String ,qty : Float)throws
    {
        print("Quantity updated :",try  self.shopping_cart.updateQuantity(item: itemFromCart , quantity: qty))
    }
    func  viewCartDetails() throws {
      try  self.shopping_cart.viewCartDetails()
    }
    func updateStatus(ordStatus : OrderStatus , orderId : Int) throws
    {
       switch(ordStatus)
       {
            case .CANCELED :
                        var str = ""
                        var temp = true
                        for TempOrder in self.orders
                        {
                            if(orderId == TempOrder.orderId)
                            {
            
                                switch (TempOrder.getOrderStatus)
                                {
                                        case .CANCELED :
                                            str = "order status already in CANCELED state"
                                            temp = false
                                            break
                                        case .DELIVERED :
                                            throw CustomError.INVALID("Order is in DELIVERED state and it cannot be updated to CANCELE state")
                                        case .OUTFORSHIPPING, .PROCESSING :
                                            TempOrder.updateStatus(orderstat: ordStatus)
                                            str += "\(ordStatus)"
                                            temp = false
                                            break
                                
                                }
                            }
                        }
                        if(temp)
                        {
                            throw CustomError.INVALID("There is no order with id : \(orderId)")
                        }
        
            case .DELIVERED, .OUTFORSHIPPING, .PROCESSING :
                throw CustomError.INVALID("Customer does not has rights to update to : \(ordStatus)")
        
        }
        
        
    }
}
