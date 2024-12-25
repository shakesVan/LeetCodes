//
//  _496. 下一个更大元素 I.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/12.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/next-greater-element-i/

import Foundation
private
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = Stack<Int>()
        // key 是当前值，value 是第一个比他大的值
        var map = [Int: Int]()
        
        for item in nums2 {
            if stack.isEmpty {
                stack.push(item)
                continue
            }
            var top = Int()
            while !stack.isEmpty && { top = stack.peek(); return item > top }() {
                map[top] = item
                stack.pop()
            }
            stack.push(item)
        }
        return nums1.map { map[$0] ?? -1 }
    }
}

import XCTest

extension XCTestCase {
    func testNextGreaterElement() {
        let s = Solution()
        var nums1: [Int], nums2: [Int]
        nums1 = [4,1,2]
        nums2 = [1,3,4,2]
        assert(s.nextGreaterElement(nums1, nums2) == [-1,3,-1])
        
        nums1 = [2,4]
        nums2 = [1,2,3,4]
        assert(s.nextGreaterElement(nums1, nums2) == [3,-1])
    }
}
