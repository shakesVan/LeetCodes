//
//  _75_颜色分类.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/3.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/sort-colors/

import Foundation

private
func sortColors(_ nums: inout [Int]) {
    var count0 = 0
    var count1 = 0
    var count2 = 0
    
    for num in nums {
        if 0 == num {
            count0 += 1
        }else if 1 == num {
            count1 += 1
        }else {
            count2 += 1
        }
    }
    var cur = 0
    while count0 > 0 {
        nums[cur] = 0
        cur += 1
        count0 -= 1
    }
    while count1 > 0 {
        nums[cur] = 1
        cur += 1
        count1 -= 1
    }
    while count2 > 0 {
        nums[cur] = 2
        cur += 1
        count2 -= 1
    }
    
}

func sortColors1(_ nums: inout [Int]) {
    var count = Array(repeating: 0, count: 3)
    
    for num in nums {
        count[num] += 1
    }
    var cur = 0
    
    for i in 0..<count.count {
        for _ in 0..<count[i] {
            nums[cur] = i
            cur += 1
        }
    }
}

import XCTest

extension XCTestCase {
    func testSortColors() {
        var nums1 = [2,0,2,1,1,0]
        sortColors(&nums1)
        assert(nums1 == [0,0,1,1,2,2])
    }
}
