//
//  _319_灯泡开关.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/25.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/bulb-switcher/

import Foundation
import XCTest

func bulbSwitch(_ n: Int) -> Int {
    return Int(sqrt(Double(n)))
}

extension XCTestCase {
    func testBulbSwitch() {
        assert(bulbSwitch(3) == 1)
        assert(bulbSwitch(4) == 2)
    }
}
