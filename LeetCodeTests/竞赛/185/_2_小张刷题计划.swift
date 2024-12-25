//
//  _2_小张刷题计划.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/25.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/season/2020-spring/problems/xiao-zhang-shua-ti-ji-hua/

import Foundation

/**
 定义状态：dp(i,m) 表示
 */
private
func minTime(_ time: [Int], _ m: Int) -> Int {
    guard m < time.count else {
        return 0
    }
    
    return 0
}

import XCTest

extension XCTestCase {
    func testMinTime() {
        
        assert(minTime([1,2,3,3], 2) == 3)
        assert(minTime([999,999,999], 4) == 0)
    }
}
