//
//  main.swift
//  Group1_W2019_3004
//
//  Created by Harsh on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation



    
do
{

    print("admin got registered : ",try Administrator.register(adminName: "Guru", userId: "guru@gmail.com", password: "11380Hp@30"))
  //  print("admin got registered : ",try Administrator.register(adminName: "Guru", userId: "guru@gmail.com", password: "11380Hp@30"))
    
   var ad = try Administrator.login(userid: "guru@gmail.com" , pass: "11380Hp@30")
    print(ad.adminName!)
    
    
    print("Customer created : ",try Customer.register(customerName: "Devang", address: "11321431", creaditCardInfo: 1234567890123456, userId: "guru1@gmail.com", password: "11380Hp@30"))
//     print("Customer created : ",try Customer.register(customerName: "Devang", address: "11321431", creaditCardInfo: 1234567890123456, userId: "guru1@gmail.com", password: "11380Hp@30"))
    var cust = try Customer.login(userid: "guru1@gmail.com", pass: "11380Hp@30")
    print(cust.customerName!)
    
    
    print("Customer created : ",try Customer.register(customerName: "Rohan", address: "11321431", creaditCardInfo: 1234567890123456, userId: "guru2@gmail.com", password: "11380Hp@30"))
    var cust2 = try Customer.login(userid: "guru2@gmail.com", pass: "11380Hp@30")
    print(cust2.customerName!)
    
    
   try ad.add_item(item_name: "CPU", price: 300)
   try ad.add_item(item_name: "hardisk", price: 70)
    try ad.add_item(item_name: "CPU", price: 400)
    
    print("present in catalog :",Items.read_items)
    
    
    try cust.addItemToShoppingCart(item: "cpu", qty: 2)
    try cust.addItemToShoppingCart(item: "cpu", qty: 3)
//     try cust.addItemToShoppingCart(item: "cpu1", qty: 3)      // CPU1 not present into catalog
    
    print("inside cart : ",cust.shopping_cart.readItemFromCart)
    
   try  cust.checkout()
  //  try cust.cancelCheckout()   // if we cancel checkout we cannot place an order
    try cust.placeOrder(shippingType: ShippingType.EXPRESS , shippingRegionId: "123")
    print("\n\n\nShopping cart after placing order : ",try cust.shopping_cart.readItemFromCart)
   try  cust.display()
    
    print("\n\n\n\nprinting all orders from administrator before  updating status of order from cust object\n\n\n\n")
    ad.display()
    // now need to change status of order 1 from cust (Note : customer can only Cancel the order i.e updating status to CANCELED)
 // try cust.updateStatus(ordStatus: OrderStatus.DELIVERED , orderId: 1)   //  Customer does not has rights to update to : DELIVERED     i.e can only update to CANCELED
  try cust.updateStatus(ordStatus: OrderStatus.CANCELED , orderId: 1)
    print("\n\n\n\nprinting all orders from customer after updating status \n\n\n\n")
  try  cust.display()
    
    
    print("\n\n\n printing all orders from administrator after updating status of order from cust object \n\n\n" )
    ad.display()
    
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





