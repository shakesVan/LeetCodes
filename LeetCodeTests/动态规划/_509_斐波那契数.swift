//
//  _509_斐波那契数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/3.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/fibonacci-number/

import Foundation
private
class Solution {
    func fib(_ N: Int) -> Int {
        if (N <= 1) { return N }
        var a = 0;
        var b = 1;
        var sum = 1;
        for _ in 0...N-2 {
            sum = a + b
            a = b
            b = sum
        }
        return b
    }

    static
    func fib1(_ N: Int) -> Int {
        guard N > 1 else { return 1 }
        if N == 2 { return 2 }
        var dp = Array(repeating: 1, count: 2)
        dp[0] = 2
        // 从dp[2] 开始
        var idx = 0
        for i in 3...N {
            idx = i & 1
            dp[idx] = dp[0] + dp[1]
        }
        
        return dp[idx]
    }

    static
    func fib2(_ N: Int) -> Int {
        let sqart5 = sqrt(5)
        let fibn = pow((1+sqart5)/2, Double(N)) - pow((1-sqart5)/2, Double(N))
        return Int(fibn / sqart5)
    }

}
