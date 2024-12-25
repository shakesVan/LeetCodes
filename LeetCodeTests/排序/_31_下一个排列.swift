//
//  _31_下一个排列.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/31.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func nextPermutation(_ nums: inout [Int]) {
    
    // 如果是不从大到小排序
    for i in 1..<nums.count {
        let index = nums.count - i
        let index_1 = index - 1
        guard nums[index_1] >= nums[index] else {
            continue
        }
        // 找出比index_1大的最小目标，交换双方的值
        var target = nums.count - 1
        while nums[target] <= nums[index_1] {
            target -= 1
        }
        (nums[index_1], nums[target]) = (nums[target], nums[index_1])
        print("nums == \(nums), target = \(target)")
        
        // 倒转后半段
        let count = (nums.count - index) / 2
        for i in index..<(index+count) {
            let other = nums.count - 1 - i + index
            (nums[other], nums[i]) = (nums[i], nums[other])
        }
        print("nums == \(nums), count = \(count)")
        
        return
        
    }
    
    // 如果是从小到大排序，用双指诊两头开始对数组逆序倒转
    let count = nums.count / 2
    for i in 0..<count {
        let index = nums.count - 1 - i
        (nums[index], nums[i]) = (nums[i], nums[index])
    }
    
}


