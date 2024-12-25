//
//  _1137_第 N 个泰波那契数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/3.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/n-th-tribonacci-number/

import Foundation
import XCTest

private
class Solution {
    static
    func tribonacci(_ n: Int) -> Int {
        
        guard n > 1 else { return n }
        if n == 2 { return 1 }
        var dp = Array(repeating: 1, count: 3)
        dp[0] = 0
        // 从dp[2] 开始
        var idx = 0
        for i in 3...n {
            idx = i % 3
            dp[idx] = dp[0] + dp[1] + dp[2]
//            print("dp[\(i)] == \(dp[idx])")
        }
        
        return dp[idx]
    }
    
}

import XCTest

extension XCTestCase {
    
    func testTribonacci() {
//        assert(Solution.tribonacci(0) == 0)
//        assert(Solution.tribonacci(1) == 1)
//        assert(Solution.tribonacci(2) == 1)
//        assert(Solution.tribonacci(4) == 4)
//        assert(Solution.tribonacci(5) == 7)
        
        assert(Solution.tribonacci(25) == 1389537)
        //        assert(Solution.tribonacci(27) == 1389537)
    }
}
