//
//  _34_在排序数组中查找元素的第一个和最后一个位置.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/5.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
        return [-1, -1]
    }
    if nums.count == 1 {
        return nums[0] == target ? [0, 0] : [-1, -1]
    }
    
    let leftTarget = Double(target) - 0.5
    let rightTarget = Double(target) + 0.5
    
    
    let left = searchInsert(nums, leftTarget)
    let right = searchInsert(nums, rightTarget) - 1
    if left > right {
        return [-1, -1]
    }
    return [left, right]
}

fileprivate
func searchInsert(_ nums: [Int], _ target: Double) -> Int {
    print("nums = \(nums), target = \(target)")
    var left = 0
    var right = nums.count
    var mid = (left + right) / 2
    while left < right - 1 {
        
        if Double(nums[mid]) == target {
            return mid
        }
        
        if Double(nums[mid]) > target {
            right = mid
        } else {
            left = mid
        }
        mid = (left + right) / 2
        print("left = \(left), right = \(right), mid = \(mid) target = \(target)")
    }
    if Double(nums[left]) < target {
        return left + 1
    } else {
        return left
    }
}
