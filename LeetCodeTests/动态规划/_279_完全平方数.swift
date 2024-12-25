//
//  _279_完全平方数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/1.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func numSquares(_ n: Int) -> Int {
        // dp(n) 为整数n的最小 完全平方数的个数
        // dp(0) = 0, dp(1) = 1, dp(2) = dp(1) + dp(1), dp(i*i) = 1
        // dp(n) = min(dp(i) + dp(n - i))
        if n <= 0 {
            return 0
        }
        
        var dpList = [Int].init(repeating: 1, count: n+1)
        dpList[0] = 0
        for i in 1...n {
            var minv = Int.max
            
            var j = 1
            while j * j <= i {
                minv = min(minv, dpList[i - j * j])
                j += 1
            }
            dpList[i] = minv + 1
        }
        return dpList[n]
        
    }
