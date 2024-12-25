//
//  _134_加油站.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    guard gas.count == cost.count else {
        return -1
    }
    
    var over: [Int] = []
    var value = 0
    
    for (g, c) in zip(gas, cost) {
        let tmp = g - c
        value += tmp
        over.append(tmp)
    }
    
    if value < 0 {
        return -1
    }
    
    var left = 0
    var right = 1
    var dp = over[left]
    
    while right < over.count {
        if dp > 0 && dp + over[right] >= 0 {
            dp += over[right]
            right += 1
            continue
        }
        
        left += 1
        right = left + 1
        dp = over[left]
    }
    
    return dp >= 0 ? left : -1
}


import XCTest

class CanCompleteCircuitCase: XCTestCase {
    func testCanCompleteCircuit() {
        assert(canCompleteCircuit([3,1,1], [1,2,2]) == 0)
        assert(canCompleteCircuit([5,1,2,3,4], [4,4,1,5,1]) == 4)
        assert(canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]) == 3)
        assert(canCompleteCircuit([2,3,4], [3,4,3]) == -1)
    }
}
