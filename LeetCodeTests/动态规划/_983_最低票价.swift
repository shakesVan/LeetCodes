//
//  _983_最低票价.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/6.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/minimum-cost-for-tickets/

import Foundation
private
class Solution {
    static
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        guard days.count > 0 else {
            return 0
        }
        /**
         定义dp(i),为从day[0]玩到第i天最少花的钱，问题就是求dp(days[days.count -1])
         dp(0) = 0
         状态转移
         dp(i) = min { dp(max(0,i-1)) + costs[0], dp(max(0,i-7)) + costs[1], dp(max(0,i-30)) + costs[2] }
         */
        let count = days.last!
        var dp = Array(repeating: 0, count: count + 1)
        dp[0] = 0
        var index = 0
        for i in 1...count {
            
            if i == days[index] {
                var minV = dp[i-1] + costs[0]
                if i-7 >= 0 {
                    minV = min(minV, dp[i-7] + costs[1])
                }else {
                    minV = min(minV, costs[1])
                }
                if i-30 >= 0 {
                    minV = min(minV, dp[i-30] + costs[2])
                }else{
                    minV = min(minV, costs[2])
                }
                dp[i] = minV
                
                index += 1
            }else {
                dp[i] = dp[i-1]
            }
        }
        
        return dp[count]
    }
}

import XCTest

extension XCTestCase {
    func testMincostTickets() {
        
        assert(Solution.mincostTickets([1,4,6,7,8,20],[2,7,15]) == 11)
        assert(Solution.mincostTickets([1,2,3,4,5,6,7,8,9,10,30,31],[2,7,15]) == 17)
        
    }
}
