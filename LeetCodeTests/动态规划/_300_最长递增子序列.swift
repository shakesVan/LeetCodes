//
//  _300_最长递增子序列.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/5.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


func lengthOfLIS(_ nums: [Int]) -> Int {
    // tail(n) 递增序列长度为n的最小值
    // tail(1) min(nums)
    // tail(n) min(tail(i) + 1), if(nums[n] < nums[i]), i 属于1...(n-1)
    if nums.count <= 1 {
        return nums.count
    }
    
    var tail: [Int] = []
    tail.append(nums[0])
    
    for i in 1..<nums.count {
        print("tail = \(tail), i = \(i)")
        if nums[i] == tail[tail.count-1] {
            continue
        }
        if nums[i] > tail[tail.count-1]  {
            tail.append(nums[i])
            continue
        }
        
        // 查找位置
        let index = searchUpdate(tail, nums[i])
        if index < tail.count {
            tail[index] = nums[i]
        } else {
            tail.append(nums[i])
        }
        
    }
    
    return tail.count
}


fileprivate
func searchUpdate(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    // 处理首个位置
    if nums[left] >= target {
        return left
    }
    
    var right = nums.count
    var mid = (left + right) / 2
    
    
    while left < right - 1 {
        
        if nums[mid] == target {
            return mid
        }
        
        if nums[mid] > target {
            right = mid
        } else {
            left = mid
        }
        mid = (left + right) / 2
        print("left = \(left), right = \(right), mid = \(mid) target = \(target)")
    }
    return right
}

func lengthOfLIS1(_ nums: [Int]) -> Int {
    // dp(n): 以n结尾的最长子序列
    // dp(0): [nums[0]]
    // dp(n):
    //      dp(0)...dp(n) append(nums[n])
    if nums.count <= 1 {
        return nums.count
    }
    var dplist = [[Int]]()
    var dp = [nums[0]]
    dplist.append(dp)
    var result = 0
    for i in 1..<nums.count {
        
        var tmp = [Int]()
        dp = tmp
        for j in 0..<i {
            tmp = dplist[j]
            if nums[i] > (tmp.last ?? Int.min) {
                tmp.append(nums[i])
            } else {
                tmp = [nums[i]]
            }
            
            if tmp.count > dp.count {
                dp = tmp
            }
            
        }
        print("i = \(i), dp = \(dp)")
        result = max(result, dp.count)
        dplist.append(dp)
    }
    return result
}
