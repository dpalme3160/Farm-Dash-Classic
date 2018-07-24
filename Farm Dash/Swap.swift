//
//  Swap.swift
//  Farm Dash
//
//  Created by Douglas W. Palme on 7/18/18.
//  Copyright © 2018 Douglas W. Palme. All rights reserved.
//

struct Swap: CustomStringConvertible, Hashable {
    let cookieA: Cookie
    let cookieB: Cookie
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }

    var hashValue: Int {
        return cookieA.hashValue ^ cookieB.hashValue
    }
    
    static func ==(lhs: Swap, rhs: Swap) -> Bool {
        return (lhs.cookieA == rhs.cookieA && lhs.cookieB == rhs.cookieB) ||
            (lhs.cookieB == rhs.cookieA && lhs.cookieA == rhs.cookieB)
    }

}
