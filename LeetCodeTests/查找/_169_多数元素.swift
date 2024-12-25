//
//  _169_多数元素.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/31.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var map = [Int: Int]()
    var maxCount = 0
    var maxValue = nums[0]
    
    for num in nums {
        if let count = map[num] {
            let tmp = count + 1
            map[num] = tmp
            if tmp > maxCount {
                maxCount = tmp
                maxValue = num
            }
        } else {
            map[num] = 1
        }
    }
    
    return maxValue
}

func majorityElement1(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    let sort = nums.sorted()
    return sort[nums.count / 2]
}
