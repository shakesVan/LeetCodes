//
//  _2419_按位与最大的最长子数组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/29.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/longest-subarray-with-maximum-bitwise-and/description/?envType=problem-list-v2&envId=brainteaser

import Foundation

func longestSubarray(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var maxV = nums.max() ?? 0
    var tmp = 0
    var result = 0
    
    for num in nums {
        
        guard num == maxV else {
            tmp = 0
            continue
        }
        
        tmp += 1
        result = max(result, tmp)
        
    }
    return result
}
