//
//  _1408_数组中的字符串匹配.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/17.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

// qian
func stringMatching(_ words: [String]) -> [String] {
    return []
}

import XCTest

extension XCTestCase {
    func testStringMatching() {
        assert(stringMatching(["mass","as","hero","superhero"]).count == 2)
        assert(stringMatching(["leetcode","et","code"]).count == 2)
        assert(stringMatching(["blue","green","bu"]).count == 0)
    }
}
