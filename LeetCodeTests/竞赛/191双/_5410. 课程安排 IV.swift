//
//  _5410. 课程安排 IV.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/30.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {
    func checkIfPrerequisite(_ n: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var map: [Int: Set<Int>] = [:]
        for item in prerequisites {
            if map[item[0]] != nil {
                map[item[0]]?.insert(item[1])
            }else {
                map[item[0]] = Set([item[1]])
            }
        }
        
        var result = Array.init(repeating: false, count: queries.count)
        for i in 0..<queries.count {
            var item = queries[i]
            
            if findItem(item[0], &item[1], in: &map) {
                result[i] = true
            }
        }
        
        return result
    }
    
    func findItem(_ key: Int, _ item: inout Int, in map: inout [Int: Set<Int>]) -> Bool {
        
        guard let set = map[key] else { return false }
        if set.contains(item) { return true }
        for newKey in set {
            
            if findItem(newKey, &item, in: &map) {
                return true
            }
        }
        return false
    }
}


import XCTest

extension XCTestCase {
    func testcheckIfPrerequisite() {
        let s = Solution()
        var n = 2, prerequisites = [[1,0]], queries = [[0,1],[1,0]]
        
        assert(s.checkIfPrerequisite(n, prerequisites, queries) == [false,true])
        
        n = 2
        prerequisites = []
        queries = [[1,0],[0,1]]
        
        assert(s.checkIfPrerequisite(n, prerequisites, queries) == [false,false])
        n = 3
        prerequisites = [[1,2],[1,0],[2,0]]
        queries = [[1,0],[1,2]]
        
        assert(s.checkIfPrerequisite(n, prerequisites, queries) == [true,true])
        
        n = 3
        prerequisites = [[1,0],[2,0]]
        queries = [[0,1],[2,0]]
        assert(s.checkIfPrerequisite(n, prerequisites, queries) == [false,true])
        
        n = 5
        prerequisites = [[0,1],[1,2],[2,3],[3,4]]
        queries = [[0,4],[4,0],[1,3],[3,0]]
        assert(s.checkIfPrerequisite(n, prerequisites, queries) == [true,false,true,false])
    }
}
