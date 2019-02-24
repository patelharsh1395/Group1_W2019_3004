//
//  main.swift
//  Group1_W2019_3004
//
//  Created by Harsh on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation


var u1 = try  User(password: "1113Hp@12", userId: "patel@gmial.com")


//var u2 = try  User(password: "1113Hp@12", userId: "patel@gmial.com")

var a1 = Administrator(adminName: "Harsh" , email: u1.userId , user : u1 )

    
do
{
try a1.add_item(item_name: "Tomato", price: 20)
try a1.add_item(item_name: "Tomato", price: 21)
try a1.add_item(item_name: "Orange", price: 23.2)
    
    
 
    
    

    let c : Bool = try  Customer.register(customerName: "Harsh", address: "903 rajshree 1", email: u1.userId , creaditCardInfo : 1234567890123456, user: u1)
    print(c)
   
    var cust = try  Customer.login(userid: "patel@gmial.com", pass:  "1113Hp@12")
    
    
   try  cust.shopping_cart.addCartItem(item_forCart: "TOMAto", quantity: 5.5)
    try cust.shopping_cart.addCartItem(item_forCart: "TOMAto", quantity: 5.5)
    try cust.shopping_cart.addCartItem(item_forCart: "Orange", quantity: 5.5)
    
    try  cust.shopping_cart.checkOut()
    try cust.placeOrder(shippingInfo: ShippingInfo())
    
    a1.display()
    
    
    
   print( cust.shopping_cart.readItemFromCart)
    
   
}
catch CustomError.EMPTY(let par)
{
    print(par)
}
catch CustomError.INVALID(let par)
{
    print(par)
}
catch CustomError.ALREADY_EXIST(let par)
{
    print(par)
}






