//
//  _5426. 重新规划路线.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/31.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var map = [Int: Set<Int>]()
        for item in connections {
            if map[item[1]] == nil {
               map[item[1]] = [item[0]]
            }else {
                map[item[1]]?.insert(item[0])
            }
        }
        
        var set: Set<Int> = []
        var key = 0
//        while map[key] != nil && set.count != n - 1 {
//            let valus = map[key]
//            valus?.forEach({ (v) in
//
//                set.insert()
//            })
//
//        }
        
        return 0
    }
}

import XCTest

extension XCTestCase {
    func testminreorder() {
        let s = Solution()
        var n = 6
        var connections = [[0,1],[1,3],[2,3],[4,0],[4,5]]
        assert(s.minReorder(6, connections) == 3)
        
        n = 5
        connections = [[1,0],[1,2],[3,2],[3,4]]
        assert(s.minReorder(6, connections) == 2)
        
        n = 3
        connections = [[1,0],[2,0]]
        assert(s.minReorder(6, connections) == 0)
    }
}
