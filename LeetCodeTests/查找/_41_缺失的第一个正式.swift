//
//  _41_缺失的第一个正式.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/7.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


func firstMissingPositive(_ nums: [Int]) -> Int {
//    print("nums = \(nums)")
//    if nums.count == 1 {
//        return nums[0] == 1 ? 2 : 1
//    }
    
    var nums = nums
    // 特殊处理数组最后一位
    var flag = false
    var tmp: Int = 0
    var i = 0
    while i < nums.count {
        
        print("i =\(i) nums = \(nums)")
        tmp = nums[i]
        
        if tmp == i || tmp <= 0 {
            i += 1
            continue
        }
        
        if tmp >= nums.count {
            if tmp == nums.count {
                flag = true
            }
            nums[i] = 0
            i += 1
            continue
        }
        
        if tmp == nums[tmp] {
            i += 1
            continue
        }
        (nums[i], nums[tmp]) = (nums[tmp], nums[i])
        
    }
    
//    print("end nums = \(nums)")
    for i in 1..<nums.count {
        if nums[i] != i {
            return i
        }
    }
    
    return flag ? (nums.count + 1) : nums.count
}


func firstMissingPositive1(_ nums: [Int]) -> Int {
    print("nums = \(nums)")
    if nums.count == 1 {
        return nums[0] == 1 ? 2 : 1
    }
    
    var nums = nums
    var tmp: Int = 0
    // 特殊处理数组最后一位
    var flag = false
    var i = 0
    while i < nums.count {
        
        print("i =\(i) nums = \(nums)")
        tmp = nums[i]
        
        if tmp == i {
            i += 1
            continue
        }
        if tmp <= 0 {
            i += 1
            continue
        }
        
        
        if tmp >= nums.count {
            if tmp == nums.count {
                flag = true
            }
            nums[i] = 0
            i += 1
            continue
        }
        
        if nums[i] == nums[tmp] {
            i += 1
            continue
        }
        (nums[i], nums[tmp]) = (nums[tmp], nums[i])
        
    }
    
    print("end nums = \(nums)")
    for i in 1..<nums.count {
        if nums[i] != i {
            return i
        }
    }
    
    return flag ? (nums.count + 1) : nums.count
    
}

