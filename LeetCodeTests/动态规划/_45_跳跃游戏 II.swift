//
//  _45_跳跃游戏 II.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/4.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/jump-game-ii/
// 未通过

import Foundation
/**
 定义：dp(i) 表示跳到i所需要的最小步数 i 属于 [0, count)
 初始化：dp(0) = 0,dp(1) = 1, dp(2) = (nums[0] >= 2) ? (dp(0) + 1) : (dp(1) + 1)
 状态转移：dp(i)
 nums[i-1] >= 1: dp(i-1) + 1
 
 nums[i-2] >= 2: dp(i-2) + 1
 nums[i-3] >= 3: dp(i-3) + 1
 nums[i-j] >= j: dp(i-j) + 1
 nums[1] >= i-1: dp(1) + 1 = 2
 nums[0] >= i: dp(0) + 1 = 1
 min 以上的最小值
 */
private
func jump(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return 0 }
    var dp = Array(repeating: Int.max, count: nums.count)
    dp[0] = 0
    dp[1] = 1
    var maxJ = 0
    var maxV = 0
    for i in 2..<nums.count {
        if nums[i] > maxV - i {
            dp[i] = min(dp[maxJ] + 1, dp[i])
            maxJ = i
            maxV = nums[i] - i
        }
        print("dp[\(i)] = \(dp[i])")
    }
    
    return dp[nums.count - 1]
}

func jump1(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return 0 }
    var dp = Array(repeating: Int.max, count: nums.count)
    dp[0] = 0
    dp[1] = 1
    for i in 2..<nums.count {
        var minV = dp[i]
        for j in 1...i {
            if nums[i-j] >= j {
                minV = min(dp[i-j] + 1, minV)
            }
        }
        dp[i] = minV
    }
    
    return dp[nums.count - 1]
}


import XCTest

extension XCTestCase {
    func testJump() {
//        assert(jump([2]) == 0)
        assert(jump([2,3,1,1,4]) == 2)
//        assert(jump([2,2,1,1,4]) == 3)
//        assert(jump([7,0,9,6,9,6,1,7,9,0,1,2,9,0,3]) == 2)
        
    }
}
