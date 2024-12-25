//
//  _50_Pow(x, n).swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/11.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class Solution {
    
    /**
     x ^ 100 = (x ^ 2) ^ 50 = ((x ^ 2) ^ 2) ^ 25 = ((x ^ 2) ^ 2) ^ 24 * ((x ^ 2) ^ 2)
            = (((x ^ 2) ^ 2) ^ 2) ^ 12 * ((x ^ 2) ^ 2)
            = ((x ^ 2) ^ 2) * (((((x ^ 2) ^ 2) ^ 2) ^ 2) ^ 2) ^ 3
            = ((x ^ 2) ^ 2) * (((((x ^ 2) ^ 2) ^ 2) ^ 2) ^ 2) * ((((((x ^ 2) ^ 2) ^ 2) ^ 2) ^ 2) ^ 2)
     m = ((x ^ 2) ^ 2) = x ^ 4
     n = (((((x ^ 2) ^ 2) ^ 2) ^ 2) ^ 2) = (((m ^ 2) ^ 2) ^ 2) = (x ^ 4) ^ 8 = x ^ 32
     k = (((m ^ 2) ^ 2) ^ 2) = x ^ 64
     令 j = m ^ 8
     x ^ 100 = m * k * k ^ 2 = (x ^ 4) * (x ^ 32) * (x ^ 64)  = m * (m ^ 8)
     1100100
     */
    func myPowHelp(_ x: Double, _ n: Int) -> Double {
        var n = n
        var result = 1.0
        var cx = x
        while n > 0 {
            if n & 1 == 1 {
                result *= cx
            }
            cx *= cx
            
            n >>= 1
        }
        return result
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        
        
        
        return n >= 0 ? myPowHelp(x,n) : (1 / myPowHelp(x,-n))
    }
    
    func myPow1(_ x: Double, _ n: Int) -> Double {
        return pow(x, Double(n))
    }
}

import XCTest

extension XCTestCase {
    func testMyPow() {
        let s = Solution()
//        assert(s.myPow(2.00000, 10) == 1024.0)
//        let r = s.myPow(2.10000, 3)
//        let rs = String.init(format: "%.5f", r)
//        assert(rs == "9.26100")
//        assert(s.myPow(2.00000, -2) == 0.25)
        
//        assert(s.myPow(0.00001, 2147483647) == 0)
        
        for i in 1...16 {

            assert(Decimal(s.myPow(2.0, i)) == pow(2, i))
        }
//        assert(s.myPow(2.0, 100) == 0)
//        assert(s.myPow(2.0, 100) == 0)
//        assert(s.myPow(2.0, 2147483647) == 0)
        
        
    }
}
