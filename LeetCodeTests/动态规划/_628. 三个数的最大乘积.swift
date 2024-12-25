//
//  _628. 三个数的最大乘积.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/18.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/maximum-product-of-three-numbers/
 
import Foundation
private
class Solution {
    
    func maximumProduct(_ nums: [Int]) -> Int {
        var maxA = Array(nums[0...2]).sorted() // 递增
        var minA = Array(nums[0...1]).sorted() // 递增
        if nums[2] < minA[1] {
            if nums[2] < minA[0] {
                minA[1] = minA[0]
                minA[0] = nums[2]
            }else {
                minA[1] = nums[2]
            }
        }
        
        for i in 3..<nums.count {
            if nums[i] > maxA[0] {
                maxA[0] = nums[i]
                
                if maxA[0] > maxA[1] {
                    maxA[0] = maxA[1]
                    maxA[1] = nums[i]
                    
                    if maxA[1] > maxA[2] {
                        maxA[1] = maxA[2]
                        maxA[2] = nums[i]
                    }
                }
            }
            
            if nums[i] < minA[1] {
                if nums[i] < minA[0] {
                    minA[1] = minA[0]
                    minA[0] = nums[i]
                }else {
                    minA[1] = nums[i]
                }
            }
            
        }
        return max(maxA.reduce(1, { $0 * $1}), maxA[2] * minA[0] * minA[1])
    }
    
    func maximumProduct1(_ nums: [Int]) -> Int {
        var maxA = Array(nums[0...2]).sorted() // 递增
        var minA = Array(nums[0...1]).sorted() // 递增
        if nums[2] < minA[1] {
            minA[1] = nums[2]
            minA = minA.sorted()
        }
        
        for i in 3..<nums.count {
            if nums[i] > maxA[0] {
                maxA[0] = nums[i]
                maxA = maxA.sorted()
            }
            if nums[i] < minA[1] {
                minA[1] = nums[i]
                minA = minA.sorted()
            }
            
        }
//        print("max = \(maxA)")
//
//        print("min = \(minA)")
        return max(maxA.reduce(1, { $0 * $1}), maxA[2] * minA[0] * minA[1])
    }
}

import XCTest

extension XCTestCase {
    func testmaximumProduct() {
        let s = Solution()
//        assert(s.maximumProduct([1,2,3]) == 6)
        assert(s.maximumProduct([1,2,3,4]) == 24)
//        assert(s.maximumProduct([1,-1,12,3]) == -3)
//        assert(s.maximumProduct([-1,-2,-3,-4]) == -6)
    }
}
