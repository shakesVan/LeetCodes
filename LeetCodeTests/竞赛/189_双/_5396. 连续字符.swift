//
//  _5396. 连续字符.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/16.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/biweekly-contest-26/problems/consecutive-characters/

import Foundation
private
class Solution {
    func maxPower(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        var result = 1
        var dp = 1
        let a = Array(s)
        for i in 1..<a.count {
            if a[i] == a[i-1] {
                dp += 1
                result = max(result, dp)
            }else {
                dp = 1
            }
        }
        
        return result
    }
}

import XCTest

extension XCTestCase {
    func testMaxPower() {
        let s = Solution()
        assert(s.maxPower("leetcode") == 2)
        assert(s.maxPower("abbcccddddeeeeedcba") == 5)
        assert(s.maxPower("triplepillooooow") == 5)
        assert(s.maxPower("hooraaaaaaaaaaay") == 11)
        assert(s.maxPower("tourist") == 1)
        
    }
}
