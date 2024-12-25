//
//  _153_寻找旋转排序数组中的最小值.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/5.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    var mid = (left + right) / 2
    while left < right - 1 {
        
        print("index left = \(left): \(nums[left]), right = \(right): \(nums[right]), mid = \(mid): \(nums[mid])")
        if nums[left] < nums[right] {
            return nums[left]
        }
        // 大数在右侧
        if nums[mid] > nums[left] {
            left = mid
            continue
        }
        //  最小数在左侧
        if nums[mid] < nums[right] {
            right = mid
            continue
        }
        mid = (left + right) / 2
        
    }
//    print("value left = \(nums[left]), right = \(nums[right]), mid = \(nums[mid])")
    
    return nums[left] < nums[right] ? nums[left] : nums[right]
}
