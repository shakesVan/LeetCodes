//
//  _292_Nim游戏.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/24.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/nim-game/

import Foundation
import XCTest

func canWinNim(_ n: Int) -> Bool {
    return (n & 3) > 0
}

class _292_Nim游戏: XCTestCase {
    func testCanWinNim() {
        assert(canWinNim(4) == false)
        assert(canWinNim(8) == false)
        assert(canWinNim(12) == false)
        
        assert(canWinNim(5) == true)
        
        assert(canWinNim(6) == true)
        assert(canWinNim(7) == true)
        assert(canWinNim(9) == true)
        assert(canWinNim(10) == true)
        assert(canWinNim(13) == true)
        assert(canWinNim(17) == true)
        assert(canWinNim(18) == true)
        
    }
}


