//
//  _5387_每个人戴不同帽子的方案数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/2.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/biweekly-contest-25/problems/number-of-ways-to-wear-different-hats-to-each-other/
// 待完成
import Foundation

private
func numberWays(_ hats: [[Int]]) -> Int {
    var vhats = hats
    var selectHats: [Int: Bool] = [:]
    
    return numberWay(&vhats, &selectHats)
}

func numberWay(_ hats: inout [[Int]], _ selectHats: inout [Int: Bool]) -> Int {
    
    var result = 0
    if hats.count == 1 {
        for hat in hats[0] {
            if selectHats[hat] == nil {
                result += 1
            }
        }
        return result
        
    }
    let hatList = hats.removeFirst()
    
    for hat in hatList {
        if selectHats[hat] == nil {
            selectHats[hat] = true
            result += numberWay(&hats, &selectHats)
        }
    }
    return result
}

import XCTest

extension XCTestCase {
    func testNumberWays() {
        assert(numberWays([[3,4],[4,5],[5]]) == 1)
        assert(numberWays([[3,5,1],[3,5]]) == 4)
        assert(numberWays([[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]]) == 24)
        assert(numberWays([[1,2,3],[2,3,5,6],[1,3,7,9],[1,8,9],[2,5,7]]) == 111)
    }
}
