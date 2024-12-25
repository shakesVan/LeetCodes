//
//  _70_爬楼梯.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/3.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/climbing-stairs/

import Foundation
private class Solution {
    static
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        // dp[0] = 1, dp[1] = 1
        var dp = Array(repeating: 1, count: 2)
        var idx = 0
        // 从dp[2] 开始
        for i in 2...n {
            idx = i & 1
            dp[idx] = dp[0] + dp[1]
        }
        
        return dp[idx]
    }
    static
    func climbStairs2(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        if n == 2 { return 2 }
        // dp[0] = 1, dp[1] = 1
        var dp = Array(repeating: 1, count: 2)
        dp[2] = 2
        // 从dp[2] 开始
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[n]
    }
    
    static
    func climbStairs3(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        if n == 2 { return 2 }
        var dp = Array(repeating: 1, count: 2)
        dp[0] = 2
        // 从dp[2] 开始
        var idx = 0
        for i in 3...n {
            idx = i & 1
            dp[idx] = dp[0] + dp[1]
        }
        
        return dp[idx]
    }
    
    static
    func climbStairs4(_ n: Int) -> Int {
        let sqart5 = sqrt(5)
        let fibn = pow((1+sqart5)/2, Double(n+1)) - pow((1-sqart5)/2, Double(n+1))
        return Int(fibn / sqart5)
    }
}

import XCTest

extension XCTestCase {
    func testClimbStairs() {
        assert(Solution.climbStairs(1) == 1)
        assert(Solution.climbStairs(2) == 2)
        assert(Solution.climbStairs(3) == 3)
        assert(Solution.climbStairs(4) == 5)
    }
}
