//
//  5406. 收集树上所有苹果的最少时间.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/10.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
    var adgesMap = [Int: Int]()
    var resultMap = [[Int]: Bool]()
    for edge in edges {
        adgesMap[edge[1]] = edge[0]
    }
    
    for i in 0..<hasApple.count {
        if hasApple[i] {
            var val = adgesMap[i]
            if val == nil { continue }
            resultMap[[i, val!]] = true
            while val != 0 {
                let key = val!
                val = adgesMap[key]
                resultMap[[key, val!]] = true
            }
        }
    }
    
    return resultMap.keys.count * 2
}
func minTime1(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
    var adgesMap = [Int: Int]()
    var resultMap = [[Int]: Bool]()
    for edge in edges {
        adgesMap[edge[1]] = edge[0]
    }
    
    for i in 0..<hasApple.count {
        if hasApple[i] {
            var val = adgesMap[i]
            if val == nil { continue }
            resultMap[[i, val!]] = true
            print("key = \(i), val = \(val)")
            while val != 0 {
                let key = val!
                val = adgesMap[key]
                resultMap[[key, val!]] = true
                print("key = \(key), val = \(val)")
            }
        }
    }
    print("keys == \(resultMap.keys)")
    let r = Set(resultMap.keys).count * 2
    print("r == \(r)")
    return r
}

import XCTest

extension XCTestCase {
    func testMinT() {
        assert(minTime(4, [[0,1],[1,2],[0,3]], [true,true,true,true]) == 6)
        
        assert(minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,true,false,true,true,false]) == 8)
        
        assert(minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,true,false,false,true,false]) == 6)
        assert(minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,false,false,false,false,false]) == 0)
    }
}

