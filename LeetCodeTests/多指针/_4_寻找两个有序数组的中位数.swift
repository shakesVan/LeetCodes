//
//  _4_寻找两个有序数组的中位数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/3.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/median-of-two-sorted-arrays/

import Foundation
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let maxC = nums1.count + nums2.count
    let mid = maxC >> 1
    var maxNums = Array(repeating: 0, count: mid + 1)
    
    var l1 = 0
    var l2 = 0
    
    for i in 0...mid {
        if l2 == nums2.count || (l1 < nums1.count && nums1[l1] <= nums2[l2]) {
             maxNums[i] = nums1[l1]
            l1 += 1
        }else {
            maxNums[i] = nums2[l2]
            l2 += 1
        }
    }
    if maxC & 1 == 1 {
        return Double(maxNums[mid])
    }else {
        return Double(maxNums[mid] + maxNums[mid-1]) / 2.0
    }
}
/// NlogN
func findMedianSortedArrays1(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var maxNums = Array(nums1)
    maxNums.append(contentsOf: nums2)
    maxNums.sort()
    let mid = maxNums.count >> 1
    if maxNums.count & 1 == 1 {
        return Double(maxNums[mid])
    }else {
        return Double(maxNums[mid] + maxNums[mid-1]) / 2.0
    }
}

func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var l1 = 0
    var l2 = 0
    
    let maxC = nums1.count + nums2.count
    
    // 奇数
    
    let midIdx = maxC >> 1 - 1
    var flag1 = true // 是否是 第一个
    while l1 + l2 < midIdx {
        if l1 < nums1.count && nums1[l1] <= nums2[l2] {
            l1 += 1
            flag1 = true
        }else {
            l2 += 1
            flag1 = false
        }
    }
    print("l1 == \(l1), l2 = \(l2), midIdx = \(midIdx)")
    let mid1 = Double(flag1 ? nums1[l1] : nums2[l2])
    
    
    var flag2 = true // 是否是 第一个
    if l1 < nums1.count && nums1[l1] <= nums2[l2] {
        l1 += 1
        flag2 = true
    }else {
        l2 += 1
        flag2 = false
    }
    
    print("l1 == \(l1), l2 = \(l2), midIdx = \(midIdx)")
    let mid2 = Double(flag2 ? nums1[l1] : nums2[l2])
    if maxC & 1 == 1 {
        return mid2
    }
    return (mid1 + mid2) / 2
    
}

import XCTest

extension XCTestCase {
    func testFindMedianSortedArrays() {
        assert(findMedianSortedArrays([1, 3], [2]) == 2.0)
        assert(findMedianSortedArrays([1, 2], [3, 4]) == 2.5)
        assert(findMedianSortedArrays([1, 4], [2, 4]) == 3.0)
    }
}
