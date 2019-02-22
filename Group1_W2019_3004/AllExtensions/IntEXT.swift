//
//  IntEXT.swift
//  Group1_W2019_3004
//
//  Created by macos on 2019-02-21.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation


extension Int
{
    func isValidCard() -> Bool
    {
        var counter = 0
        var temp  = self
        
        while( temp != 0 )
        {   counter+=1
            temp = temp/10
            
        }
        if(counter == 16)
        {
        return true
        }
        return false
    }
}
