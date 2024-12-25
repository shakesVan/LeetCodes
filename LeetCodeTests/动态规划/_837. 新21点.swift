//
//  _837. 新21点.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/3.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class Solution {
    func new21Game(_ N: Int, _ K: Int, _ W: Int) -> Double {
        /**
         定义状态：dp(k, n) 表示分数 大于等于 k 并 小于等于 n的概率
         初始值：dp(0, _) = 1, dp(1, n) = n / W
         状态转移：dp(k, n) = (dp(k - W, n - W) + dp(k - W + 1, n - W + 1) + ... + dp(k-1, n-1)) * 1 / W
         
         */
        
        return 0
    }
}

import XCTest

extension XCTestCase {
    func testNew21Game() {
        let s = Solution()
        var N = 10, K = 1, W = 10
        assert(s.new21Game(N, K, W) == 1)

        N = 6
        K = 1
        W = 10
        assert(s.new21Game(N, K, W) == 0.6)
        
        N = 21
        K = 17
        W = 10
        assert(s.new21Game(N, K, W) == 0.73278)
    }
}
