//
//  _下一个更大元素 II.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/12.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        //idx
        var stack = Stack<Int>()
        // key 是当前值的idx，value 是第一个比他大的值的idx
        var map = [Int: Int]()
        let nums2 = nums + nums
        
        for i in 0..<nums2.count {
            if stack.isEmpty {
                stack.push(i)
                continue
            }
            var topIdx = Int()
            while !stack.isEmpty && { topIdx = stack.peek(); return nums2[i] > nums2[topIdx] }() {
                let idx = topIdx % nums.count
                if map[idx] == nil {
                    map[idx] = i % nums.count
                }
                stack.pop()
            }
            stack.push(i)
        }
        return nums.enumerated().map {
            guard let idx = map[$0.offset] else { return -1 }
            return nums[idx]
        }
    }
}

import XCTest

extension XCTestCase {
    func testNextGreaterElements() {
        let s = Solution()
        assert(s.nextGreaterElements([1,2,1]) == [2, -1, 2])
        
        
        
        assert(s.nextGreaterElements(
               [100,1,11,1, 120,111,123,1, -1,-100])
            == [120,11,120,120, 123,123,-1,100, 100,100])
               
    }
}
