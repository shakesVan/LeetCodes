//
//  _35_搜索插入位置.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/5.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    print("nums = \(nums), target = \(target)")
    var left = 0
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
    if nums[left] < target {
        return left + 1
    } else {
        return left
    }
}



