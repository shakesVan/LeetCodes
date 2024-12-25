//
//  _5386_检查一个字符串是否可以打破另一个字符串.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/2.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/biweekly-contest-25/problems/check-if-a-string-can-break-another-string/

import Foundation

private
func checkIfCanBreak(_ s1: String, _ s2: String) -> Bool {
    let list1 = Array(s1).sorted()
    let list2 = Array(s2).sorted()
    var isUp = true
    var isDown = true
    for i in 0..<list1.count {
        if list1[i] < list2[i] {
            isDown = false
        }else if list1[i] > list2[i] {
            isUp = false
        }
        if !isUp && !isDown {
            return false
        }
    }
    
    return true
}

import XCTest

extension XCTestCase {
    func testCheckIfCanBreak() {
        assert(checkIfCanBreak("abc","xya") == true)
        assert(checkIfCanBreak("abe", "acd") == false)
        assert(checkIfCanBreak("leetcodee","interview") == true)
    }
}
