//
//  _5412. 在既定时间做作业的学生人数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/17.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {
    func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        let count = startTime.count
        var ans = 0
        for i in 0..<count {
            if startTime[i] <= queryTime && endTime[i] >= queryTime {
                ans += 1
            }
        }
        return ans
    }
}

import XCTest

extension XCTestCase {
    func testBusyStudent() {
        let s = Solution()
        assert(s.busyStudent([1,2,3], [3,2,7], 4) == 1)
        assert(s.busyStudent([4], [4], 4) == 1)
        assert(s.busyStudent([4], [4], 5) == 0)
        assert(s.busyStudent([1,1,1,1], [1,3,2,4], 7) == 0)
        assert(s.busyStudent([9,8,7,6,5,4,3,2,1], [10,10,10,10,10,10,10,10,10], 5) == 5)
        
    }
}
