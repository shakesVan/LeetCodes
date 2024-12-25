//
//  _152. 乘积最大子数组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/18.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/maximum-product-subarray/

import Foundation

private
class Solution {
    /**
     定义状态：maxdp(i),表示以i结尾的最大子数组 i [0,count)
     定义状态：mindp(i),表示以i结尾的最小的子数组 i [0,count)
     
     初始值：
     dp(0) = nums[0],
     adp(0) = nums[0],
     ans = nums[0],
     
     状态转移：
     maxdp(i) = max(maxdp(i-1) * nums[i], mindp(i-1) * nums[i], nums[i])
     mindp(i) = min(maxdp(i-1) * nums[i], mindp(i-1) * nums[i], nums[i])
     
     
     */
    func maxProduct(_ nums: [Int]) -> Int {
        var maxdp = nums[0]
        var mindp = nums[0]
        var ans = maxdp
        for i in 1..<nums.count {
            let oldmaxdp = maxdp
            maxdp = max(max(maxdp * nums[i], mindp * nums[i]), nums[i])
            mindp = min(min(oldmaxdp * nums[i], mindp * nums[i]), nums[i])
            ans = max(ans, maxdp)
        }
        return ans
    }
}

import XCTest

extension XCTestCase {
    func testMaxProduct() {
        let s = Solution()
        assert(s.maxProduct([2,3,-2,4]) == 6)
        assert(s.maxProduct([-2,0,-1]) == 0)
        assert(s.maxProduct([-2]) == -2)
        assert(s.maxProduct([-2, 0]) == 0)
        assert(s.maxProduct([0, -2]) == 0)
        assert(s.maxProduct([-2,2,-1,3]) == 12)
        assert(s.maxProduct([-4,-3]) == 12)
        assert(s.maxProduct([2,-5,-2,-4,3]) == 24)
        
        
    }
}
