//
//  main.swift
//  Group1_W2019_3004
//
//  Created by Harsh on 2019-02-19.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation

//print("Hello, World!")
//
//
//var c = "sushmitha@gmail.com"
//print(c.isValidEmail())




//var ad : [Administrator] = []
//ad.append( Administrator(adminName: "chamdi_boys", email: "sushmitha@gmail.com"))


var Tomato = Items(item_price: 4.5, item_name: "Tomato")
var Onion = Items(item_price: 2.4, item_name: "Onion")
var Orange = Items(item_price:3.5 , item_name: "Orange")
var Apple = Items(item_price:4.5 , item_name: "Apple")
var Potato = Items(item_price: 2.1, item_name: "Potato")
var Banana = Items(item_price: 2.0 , item_name: "Banana")


var  sp = ShoppingCart(cartId: 1 )
sp.addCartItem(item: Tomato, quantity: 2.3)
sp.addCartItem(item: Apple, quantity: 3)

print(sp.viewCartDetails())
print("Hello world")



var arr = [(Int,String)]()

arr.append((1, "Harsh"))
arr.append((2, "3"))


if (arr[0].0 == 1)
{
    arr[0].1 = "Patel"
}


for (i,s) in arr
{
    print(i,s)
}



