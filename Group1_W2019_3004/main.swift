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
    
    print(Items.read_items)
}
catch CustomError.ALREADY_EXIST(let par)
{
print(par)
}


//case EMPTY(String)
//case INVALID(String)
//case ALREADY_EXIST(String)

do{
    

    var c : Bool = try  Customer.register(customerName: "Harsh", address: "903 rajshree 1", email: u1.userId , creaditCardInfo : 1234567890123456, user: u1)
    print(c)
   
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


//do
//{
////var user1 = try? User(id: "patelharsh1@gmail.com",  pass: "1114Hp30@"  )
////var user2 = try? User(id: "patelharsh1@gmail.com",  pass: "1114Hp30@"  )
//
//    _ = try User(password: "1114Hp30@", userId: "patelharsh1@gmail.com")
//    _ = try User(password: "1114Hp30@", userId: "patelharsh1@gmail.com")
//}
//catch CustomError.EMPTY(let par)
//{
//    print(par)
//}
//catch CustomError.INVALID(let par)
//{
//    print(par)
//}
//catch CustomError.ALREADY_EXIST(let par)
//{
//    print(par)
//}


