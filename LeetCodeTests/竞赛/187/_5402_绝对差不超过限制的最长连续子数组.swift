//
//  _5402_绝对差不超过限制的最长连续子数组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/3.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/weekly-contest-187/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/

import Foundation

func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
    /**
     >定义dp：dp(i) 表示以 第i项 结尾，满足限制的最长连续子数组的长度 i 属于 [0, nums.count)
     >初始值：dp(0) = 1, dp(1) = abs(nums[1] - nums[0]) <= limit ? (dp(0) + 1) : 1
     >状态转移：设满足条件的子数组中的最大值为 nums[maxIdx]，最小值为 nums[minIdx]
     如果 nums[i] >= nums[minIdx] && nums[i] <= nums[maxIdx], dp(i) = dp(i-1) + 1
     如果nums[i] <= nums[minIdx], 则 nums[minIdx] = nums[i]
        如果 nums[i] >= nums[maxIdx] - limit, dp(i) = dp(i-1) + 1
        否则 从i开始往前计算dp
     如果nums[i] >= nums[maxIdx], 则 nums[maxIdx] = nums[i]
        如果 nums[i] <= nums[minIdx] + limit, dp(i) = dp(i-1) + 1
        否则 从i开始往前计算dp
     
     */
    
    var minIdx = 0
    var maxIdx = 0
    
    var dp = 1
    var result = dp
    for i in 1..<nums.count {
        if nums[i] > nums[minIdx] && nums[i] < nums[maxIdx] {
            dp += 1
        }else if nums[i] <= nums[minIdx] {
            minIdx = i
            if nums[i] >= nums[maxIdx] - limit {
                dp += 1
            }else {
                // 从 i 开始遍历到 maxIdx（倒叙），找出第一个不满足，nums[j] > nums[minIdx] + limit的值，并寻找新的最小值
                let rang = (maxIdx..<i).reversed()
                dp = 1
                maxIdx = i
                for j in rang {
                    if nums[j] > nums[minIdx] + limit  { break }
                    if nums[j] > nums[maxIdx] { maxIdx = j }
                    dp += 1
                }
            }
        }else if nums[i] >= nums[maxIdx] {
            maxIdx = i
            if nums[i] <= nums[minIdx] + limit {
                dp += 1
            }else {
                // 从 i 开始遍历到 minIdx（倒叙），找出第一个不满足，nums[j] < nums[maxIdx] - limit的值,dp每遍历一次就加一，并寻找新的最小值
                let rang = (minIdx..<i).reversed()
                dp = 1
                minIdx = i
                for j in rang {
                    // 这里判断是 当前z
                    if nums[j] < nums[maxIdx] - limit  { break }
                    if nums[j] < nums[minIdx] { minIdx = j }
                    dp += 1
                }
            }
        }
//        print("i = \(i), dp = \(dp), nums[minIdx] = \(nums[minIdx]), nums[maxIdx] = \(nums[maxIdx])")
        result = max(result, dp)
    }
    
    return result
}

import XCTest

extension XCTestCase {
    func testLongestSubarray() {
        assert(longestSubarray([8,2,4,7], 4) == 2)
        assert(longestSubarray([1,2,4,7,2], 5) == 4)
        assert(longestSubarray([10,1,2,4,7,2], 5) == 4)
        assert(longestSubarray([4,2,2,2,4,4,2,2], 0) == 3)
    }
}
