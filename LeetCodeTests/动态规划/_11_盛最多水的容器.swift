//
//  _11_盛最多水的容器.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/18.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/container-with-most-water/

import Foundation


func maxArea(_ height: [Int]) -> Int {
    guard height.count > 1 else { return 0 }
    var maxA = 0
    
    var left = 0
    var right = height.count - 1
    while left < right {
        
        if height[left] <= height[right] {
            maxA = max(maxA, height[left] * (right - left))
            left += 1
        }else {
            maxA = max(maxA, height[right] * (right - left))
            right -= 1
        }
        
    }
    return maxA
}

// 超时
func maxArea1(_ height: [Int]) -> Int {
    var maxA = 0
    let count = height.count
    for i in 0..<count {
        for j in ((i+1)..<count).reversed() {
            maxA = max(maxA, min(height[i],height[j]) * (j - i))
        }
    }
    return maxA
}


import XCTest

extension XCTestCase {
    func testMaxArea() {
        assert(maxArea([1,8,6,2,5,4,8,3,7]) == 49)
    }
}
