//
//  _080_黑板异或游戏.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/28.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/chalkboard-xor-game/description/?envType=problem-list-v2&envId=brainteaser
 
import Foundation

/**

定义状态：dp(i)表示 剩余的数字数
初始值：dp(0) = nums[0]，dp(1) = nums[1] | dp(0)
状态转移方程：dp(i)

dp(i) = dp(i-1) ｜ nums[i]
 */

func xorGame(_ nums: [Int]) -> Bool {
    if nums.count % 2 == 0 {
        return true
    }
    
    let result = nums.reduce(0) {
        $0 ^ $1
    }
    
    return result == 0
}
