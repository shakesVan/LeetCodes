//
//  _55_跳跃游戏.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/17.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
/**
 nums [2,3,1,1,4]
 定义dp：dp[i]表示跳到i点剩余可以前进的最大步数 如果dp[i] < 0 则无法到达i
 初始值：
 dp[0] = nums[0]    2
 dp[1] = max(nums[0], dp[0]) - 1  1
 dp[2] = max(nums[1], dp[1]) - 1 2
 dp[3] = max(nums[2], dp[2]) - 1 1
 dp[4] = max(nums[3], dp[3]) - 1 0
 状态转移方程
 dp[i] = max(nums[i-1], dp[i-1]) - 1
 如果dp[i] < 0 return false
 dp[i] >= 0 return true
 
 */
private
func canJump(_ nums: [Int]) -> Bool {
    var dp = nums[0]
    for i in 1..<nums.count {
        dp = max(dp, nums[i-1]) - 1
        if dp < 0 { return false }
        if dp >= nums.count - i - 1 {
            return true
        }
    }
    return true
}

import XCTest

extension XCTestCase {
    func testCanJump() {
        assert(canJump([2,3,1,1,4]) == true)
        assert(canJump([3,2,1,0,4]) == false)
    }
}
