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




var ad : [Administrator] = []
ad.append( Administrator(adminName: "chamdi_boys", email: "sushmitha@gmail.com"))

for i in ad
{
    print(i.adminName! , i.email!)
}

