//
//  Swap.swift
//  Farm Dash
//
//  Created by Douglas W. Palme on 7/18/18.
//  Copyright © 2018 Douglas W. Palme. All rights reserved.
//

struct Swap: CustomStringConvertible {
    let cookieA: Cookie
    let cookieB: Cookie
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}
