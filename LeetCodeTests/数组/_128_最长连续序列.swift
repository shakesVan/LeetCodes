//
//  _128_最长连续序列.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/24.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/longest-consecutive-sequence/description/?envType=study-plan-v2&envId=top-100-liked

import Foundation

func longestConsecutive(_ nums: [Int]) -> Int {
    
    if nums.count <= 1 {
        return nums.count
    }
    
    let arr = nums.sorted()
    
    var befer = arr[0]
    var tmp = 1
    var result = tmp
    
    for i in 1..<arr.count {
        
        if arr[i] == befer {
            continue
        }
        if arr[i] == befer + 1 {
            tmp += 1
            result = max(result, tmp)
        } else {
            tmp = 1
        }
        befer = arr[i]
    }
    
    return result
}


import XCTest
private
class FYLongestConsecutiveTestCase: XCTestCase {
    func testLongestConsecutive() {
        let nums1 = [1,2,3,0,0,0]
        assert(longestConsecutive(nums1) == 4)
        
        let nums2 = [0,3,7,2,5,8,4,6,0,1]
        assert(longestConsecutive(nums2) == 9)
        
        let nums3 = [1,2,0,0,0]
        assert(longestConsecutive(nums3) == 3)
    }
}

