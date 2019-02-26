//
//  IntEXT.swift
//  Group1_W2019_3004
//
//  Created by macos on 2019-02-21.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation

extension Float
{
    func roundedVal() -> Float
    {
        var temp = self
        temp = temp * 100
        temp.round()
        return Float(temp/100)
    }
    func dollar () -> String
    {
        return "$"+String(self)
    }
}
