//
//  _1033_移动石子直到连续.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/25.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/moving-stones-until-consecutive/

import Foundation
import XCTest

func numMovesStones(_ a: Int, _ b: Int, _ c: Int) -> [Int] {
    let array = [a, b , c].sorted()
    
    let maxT = array[2] - array[0] - 2
    if maxT == 0 {
        return [0, 0]
    }
    // 小于3
    if min(array[2] - array[1], array[1] - array[0]) < 3 {
        return [1, maxT]
    }
    return [2 , maxT]
}

extension XCTestCase {
    func testNumMovesStones() {
        assert(numMovesStones(1, 2, 5) == [1, 2])
        
        assert(numMovesStones(4, 3, 2) == [0, 0])
        assert(numMovesStones(3, 5, 1) == [1, 2])
        assert(numMovesStones(7, 4, 1) == [2, 4])
    }
}
