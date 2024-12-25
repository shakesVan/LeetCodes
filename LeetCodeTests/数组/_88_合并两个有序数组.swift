//
//  _88_合并两个有序数组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/1.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/merge-sorted-array/

import Foundation

import XCTest

private
// 最精简
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var p1 = m - 1
    var p2 = n - 1
    var curr = nums1.count - 1
    while  p2 >= 0 {
        if p1 >= 0 && nums1[p1] > nums2[p2] {
            nums1[curr] = nums1[p1]
            p1 -= 1
            curr -= 1
        }else {
            nums1[curr] = nums2[p2]
            p2 -= 1
            curr -= 1
        }
    }
}
// 最优
func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var p1 = m-1
    var p2 = n-1
    var index = m + n - 1
    while p1 >= 0 && p2 >= 0 {
        if nums1[p1] > nums2[p2] {
            nums1[index] = nums1[p1]
            p1 -= 1
        }else {
            nums1[index] = nums2[p2]
            p2 -= 1
        }
        index -= 1
    }
    
    while p2 >= 0 {
        nums1[index] = nums2[p2]
        p2 -= 1
        index -= 1
    }
    
}
// 最简单思路
func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    let tmp = nums1
    var p1 = 0
    var p2 = 0
    var index = 0
    while p1 < m || p2 < n {
        if p1 < m && (p2 == n || tmp[p1] < nums2[p2]) {
            nums1[index] = tmp[p1]
            p1 += 1
        }else {
            nums1[index] = nums2[p2]
            p2 += 1
        }
        index += 1
    }
    
}

extension XCTestCase {
    func testMerge() {
        var nums1 = [1,2,3,0,0,0]
        merge(&nums1, 3, [2,5,6], 3)
        assert(nums1 == [1,2,2,3,5,6])
    }
}
