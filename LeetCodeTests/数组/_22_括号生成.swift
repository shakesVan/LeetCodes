//
//  _22_括号生成.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/9.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/generate-parentheses/
// 抄的答案

import Foundation


fileprivate
func generateParenthesis(_ n: Int) -> [String] {
    // dp(n): n对括号所有的括号组合, n >= 1, Cdp意味拆开dp所有项分别处理
    // dp(1) = ["()"], dp(1).count = 1
    // dp(n) = "("+Cdp(n-1)+")", "()"+Cdp(n-1)，Cdp(n-1)+"()"  （需去重减一）
    let left = "("
    let right = "("
    if n <= 0 {
        return []
    }
    
    var dp = ["()"]
    if n == 1 {
        return dp
    }
    
    var tmp = [String]()
    for _ in 2...n {
        tmp = []
        for str in dp {
            tmp.append("(\(str))")
            tmp.append("()\(str)")
            tmp.append("\(str)()")
            
        }
        // 去重
        tmp.removeLast()
        dp = tmp
    }
    return dp
    
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
