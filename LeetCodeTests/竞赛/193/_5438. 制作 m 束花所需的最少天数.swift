//
//  _5438. 制作 m 束花所需的最少天数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/14.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class Solution {
    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        guard bloomDay.count >= m * k else { return -1 }
        
        return -1
    }
}

import XCTest

extension XCTestCase {
    func testMinDays() {
        let s = Solution()
        var bloomDay = [1,10,3,10,2]
        var m = 3
        var k = 1
        assert(s.minDays(bloomDay, m, k) == 3)
        
        bloomDay = [1,10,3,10,2]
        m = 3
        k = 2
        assert(s.minDays(bloomDay, m, k) == -1)
        
        bloomDay = [7,7,7,7,12,7,7]
        m = 2
        k = 3
        assert(s.minDays(bloomDay, m, k) == 12)
        
        bloomDay = [1000000000,1000000000]
        m = 1
        k = 1
        assert(s.minDays(bloomDay, m, k) == 1000000000)
        
        bloomDay = [1,10,2,9,3,8,4,7,5,6]
        m = 4
        k = 2
        assert(s.minDays(bloomDay, m, k) == 9)
    }
}
