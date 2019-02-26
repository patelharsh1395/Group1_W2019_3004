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
//try a1.add_item(item_name: "toma", price: 20)
    
 
    
    

    let c : Bool = try  Customer.register(customerName: "Harsh", address: "903 rajshree 1", email: u1.userId , creaditCardInfo : 1234567890123456, user: u1)
   // print(c)
   
    var cust = try  Customer.login(userid: "patel@gmial.com", pass:  "1113Hp@12")
    
    
  
  try  cust.addItemToShoppingCart(item: "TOMAto", qty: 5.5)
   try  cust.addItemToShoppingCart(item: "TOMAto", qty: 6.5)
    try cust.addItemToShoppingCart(item: "Orange", qty: 5.2)
//try  cust.viewCartDetails()
    try  cust.checkout()
   // print("shopping cart : ****" )
// cust.cancelCheckout()
    print("\n\n\n\n")
    try cust.placeOrder( shippingType: ShippingType.REGULAR , shippingRegionId: "m2h2x9")
    
    
//try  cust.shopping_cart.viewCartDetails()
    
    
    
   // a1.display()
    //cust.orders[0].updateStatus(order: OrderStatus.CANCELED)
  // print(cust.orders[0].status)
   // Administrator.view_orders[0].updateStatus(order: OrderStatus.DELIVERED)
    //print(cust.orders[0])
   
   print(a1.display())
    print(Items.read_items)
  try  a1.removeItem(itemList: "Tomato")
    print("Shopping cart : ")
   try cust.viewCartDetails()
    
 try  cust.shopping_cart.addCartItem(item_forCart: "tomato", quantity: 20)
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




//let x :Float = 1.23556789
//let y = Double(round(1000*x)/1000)
//print(y)





