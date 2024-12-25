//
//  _69_x 的平方根.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/9.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {
    static
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else { return x }
        var l = 0
        var r = x
        //[l,r]
        while l < r {
            let mid = (l + r + 1) >> 1
            let res = mid * mid
            if res > x {
                r = mid - 1
            }else {
                l = mid
            }
        }
        return l
    }
    func mySqrt3(_ x: Int) -> Int {
        guard x > 1 else { return x }
        var l = 0
        var r = x
        var mid: Int = (l + r) >> 1
        //[l,r)
        var res: Int = mid * mid
        while l < r {
            if res == x { return mid }
            if res > x {
                r = mid
            }else {
                l = mid + 1
            }
            mid = (l + r) >> 1
            res = mid * mid
//            print("l = \(l), r = \(r), mid == \(mid)")
        }
        // 有可能没有找到值，最后的mid是第一个比他大的值，向下取整
        if res > x { return mid - 1 }
        return mid
        
    }
    
    static
    func mySqrt2(_ x: Int) -> Int {
        return Int(mySqrt(Double(x), 1.0))
    }
    static
        // 失败 需要精确i精度
    func mySqrt(_ x: Double, _ mut: Double) -> Double {
        print("x == \(x), mut = \(mut)")
        guard x > 1 else { return x * mut }
        guard x > 3 else { return 1 * mut }
        let tmp = x / 4
        return mySqrt(tmp, mut * 2)
    }
    
    func mySqrt1(_ x: Int) -> Int {
        
        return Int(sqrt(Double(x)))
    }
}

import XCTest

extension XCTestCase {
    func testMySqrt() {
        assert(Solution.mySqrt(0) == 0)

        assert(Solution.mySqrt(1) == 1)
        assert(Solution.mySqrt(3) == 1)
        assert(Solution.mySqrt(4) == 2)
        assert(Solution.mySqrt(5) == 2)
        assert(Solution.mySqrt(8) == 2)

        assert(Solution.mySqrt(101) == 10)
    }
}
