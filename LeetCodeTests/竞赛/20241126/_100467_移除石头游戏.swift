//
//  _100467_移除石头游戏.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/23.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func canAliceWin(_ n: Int) -> Bool {
    
    var tmp = n
    var mine = 10
    var result = false
    while tmp > 0 {
        if tmp - mine < 0 {
            return result
        }
        tmp -= mine
        mine -= 1
        result = !result
    }
    return result
}


import XCTest

class CanAliceWinCase: XCTestCase {
    func testCanAliceWin() {
        assert(canAliceWin(12) == true)
        assert(canAliceWin(1) == false)
        assert(canAliceWin(10) == true)
        assert(canAliceWin(1) == false)
    }
}



