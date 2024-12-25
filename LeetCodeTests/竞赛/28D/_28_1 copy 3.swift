//
//  _28_1.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/13.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        let c_1 = prices.count - 1
        guard c_1 > 0 else { return prices }
        
        var ans = prices
        var i = 0
        var j = 1

        while i < c_1 {
            if prices[i] >= prices[j] {
                ans[i] = prices[i] - prices[j]
                i += 1
                j = i + 1
            }else if j < c_1 {
                j += 1
            }else {
                i += 1
                j = i + 1
            }
        }
        return ans
    }
}

import XCTest

extension XCTestCase {
    func testFinalPrices() {
        let s = Solution()
        assert(s.finalPrices([8,4,6,2,3]) == [4,2,4,2,3])
//        assert(s.finalPrices([1,2,3,4,5]) == [1,2,3,4,5])
//        assert(s.finalPrices([10,1,1,6]) == [9,0,1,6])
    }
}
