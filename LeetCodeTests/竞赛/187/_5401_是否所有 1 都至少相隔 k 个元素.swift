//
//  _5401_是否所有 1 都至少相隔 k 个元素.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/3.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/weekly-contest-187/problems/check-if-all-1s-are-at-least-length-k-places-away/

import Foundation

private
func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
    if k == 0 { return true }
    
    var idx = 0
    for num in nums {
        if num == 1 {
            if idx > 0 { return false }
            idx = k
        }else {
            idx -= 1
        }
    }
    return true
}

import XCTest

extension XCTestCase {
    func testKLengthApart() {
        assert(kLengthApart([1,0,0,0,1,0,0,1], 2) == true)
        assert(kLengthApart([1,0,0,1,0,1], 2) == false)
        assert(kLengthApart([1,1,1,1,1], 0) == true)
        assert(kLengthApart([0,1,0,1], 1) == true)
    }
}
