//
//  _416_分割等和子集.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/18.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/partition-equal-subset-sum/

import Foundation
/**
 定义： dp(i,j)表示 i以内能刚好达到j值 i -> [0,nums.conut]
 初始化：dp(0,j) = false,dp(i,0) = false,
 dp(0,0) = true
 状态转移：
 如果 j-nums[i-1] >= 0
 dp(i,j) = dp(i-1,j) || dp(i-1, j-nums[i-1]])
 */

func canPartition(_ nums: [Int]) -> Bool {
    var sum = nums.reduce(0) { $0 + $1 }
    if sum & 1 == 1 { return false }
    sum >>= 1
    var dp = Array(repeating: false, count: sum + 1)
    dp[0] = true
    
    for num in nums {
        if sum < num { return false }
        for j in (num...sum).reversed() {
            if dp[j - num] { dp[j] = true }
        }
    }
    return dp[sum]
}

func canPartition2(_ nums: [Int]) -> Bool {
    var sum = nums.reduce(0) { $0 + $1 }
    if sum & 1 == 1 { return false }
    sum >>= 1
    let sortNums = nums.sorted()
//    print("sum == \(sum)")
    // 求 nums 中是否有组成 sum的值
    var dp = Array(repeating: false, count: sum + 1)
    dp[0] = true
    var nums_i_1: Int
    for i in 1...sortNums.count {
        nums_i_1 = sortNums[i-1]
        if sum < nums_i_1 { return false }
        for j in (nums_i_1...sum).reversed() {
            dp[j] = dp[j] || dp[(j - nums_i_1)]
        }
        // 如果找到一个符合的就退出
        if dp[sum] {
            return true
        }
//        print("dp == \(dp)")
    }
    return false
}

/**
定义： dp(i,j)表示 i以内能刚好达到j值 i -> [0,nums.conut]
初始化：dp(0,j)表示找不到，dp(i,0)表示找不到 dp(0,0) = 0
状态转移：
如果 j-nums[i-1] >= 0
dp(i,j) = max(dp(i-1,j), dp(i-1, j-nums[i-1]]) + nums[i-1])
*/
func canPartition1(_ nums: [Int]) -> Bool {
    var sum = 0
    for num in nums {
        sum += num
    }
    if sum & 1 == 1 { return false }
    sum >>= 1
    
//    print("sum == \(sum)")
    // 求 nums 中是否有组成 sum的值
    var dp = Array(repeating: Int.min, count: sum + 1)
    dp[0] = 0
    var nums_i_1: Int
    for i in 1...nums.count {
        nums_i_1 = nums[i-1]
        if sum < nums_i_1 { continue }
        for j in (nums_i_1...sum).reversed() {
            dp[j] = max(dp[j], dp[(j - nums_i_1)] + nums_i_1)
        }
//        print("dp == \(dp)")
    }
    return dp[sum] > 0
}

import XCTest

extension XCTestCase {
    func testCanPartition() {
        assert(canPartition([1, 5, 11, 5]) == true)
        assert(canPartition([1,2,3,5]) == false)
        assert(canPartition([1,2,5]) == false)
       
    }
}
