//
//  _33_搜索旋转排序数组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/27.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/search-in-rotated-sorted-array/

import Foundation

private
func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count
    var center: Int
    while left < right {
        center = (left + right) >> 1
        print("left = \(left), center = \(center), right = \(right)")
        if target == nums[center] { return center }
        // 左边 == 中间
        if nums[center] == nums[left] { return -1 }
        if target == nums[left] { return left }

        // 最大值在左边
        if nums[center] < nums[left] {
            //center < target < right-1
            if target > nums[center] && target < nums[left] {
                left = center + 1
            }else {
                right = center
            }
            
        // 最大值在右边
        }else {

            // 判断是否满足 left < target < center
            if target < nums[center] && target > nums[left] {
                right = center
            }else {
                left = center + 1
            }
        }
    }
    
    return  -1
}

import XCTest

extension XCTestCase {
    func testSearch() {
        assert(search([4,5,6,7,0,1,2], 0) == 4)
        assert(search([4,5,6,7,0,1,2], 3) == -1)
        assert(search([4,5,6,7,0,1,2], 5) == 1)
        assert(search([4,5,6,7,0,1,2], 4) == 0)
        assert(search([4,5,6,7,0,1,2], 2) == 6)
        assert(search([4,5,6,7,0,1,2], 1) == 5)
        assert(search([5,1,3], 3) == 2)
        assert(search([7,8,1,2,3,4,5,6], 2) == 3)
        
    }
}
