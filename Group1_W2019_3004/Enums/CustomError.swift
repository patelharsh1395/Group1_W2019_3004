//
//  CustomError.swift
//  Group1_W2019_3004
//
//  Created by macos on 2019-02-22.
//  Copyright © 2019 Harsh. All rights reserved.
//

import Foundation


enum CustomError : Error
{
    case EMPTY(String)
    case INVALID(String)
    case ALREADY_EXIST(String)
    
}
