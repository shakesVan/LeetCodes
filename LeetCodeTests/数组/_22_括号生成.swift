//
//  _22_括号生成.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/9.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/generate-parentheses/
// 抄的答案

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    return []
}

import XCTest

extension XCTestCase {
    func testGenerateParenthesis() {
        assert(generateParenthesis(3) == [
            "((()))",
            "(()())",
            "(())()",
            "()(())",
            "()()()"
            ]
        )
    }
}
