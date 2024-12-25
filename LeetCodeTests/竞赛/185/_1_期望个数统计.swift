//
//  _1_期望个数统计.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/25.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
func expectNumber(_ scores: [Int]) -> Int {
    let set = Set(scores)
    return set.count
}

import XCTest

extension XCTestCase {
    func testExpectNumber() {
        assert(expectNumber([1,2,3]) == 3)
        assert(expectNumber([1,1]) == 1)
        
        assert(expectNumber([1,1,2]) == 2)
    }
}
