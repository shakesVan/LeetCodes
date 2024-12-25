//
//  _202_快乐数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/30.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
func isHappy(_ n: Int) -> Bool {
    
    var slow = n
    var fast = n
    repeat {
        slow = getNext(slow)
        fast = getNext(getNext(fast))
    } while fast != slow
    
    return slow == 1
}

func getNext(_ n: Int) -> Int {
    var res = n
    var sum = 0
    while res > 0 {
        let tmp = res % 10
        sum += tmp * tmp
        res /= 10
    }
    return sum
}
func isHappy2(_ n: Int) -> Bool {
    
    var resultMap = [Int: Int]()
    var result = n
    
    while resultMap[result] == nil {
        resultMap[result] = 1
        if result == 1 { return true }
        result = getNext(result)
        print("result === \(result)")
    }
    
    return false
}


func isHappy1(_ n: Int) -> Bool {
    
    var map = [Int]()
    for i in 0...9 {
        map.append(i * i)
    }
    
    var resultMap = [Int: Int]()
    var result = n
    var sum = 0
    
    while resultMap[result] == nil {
        if result == 0 {
            if sum == 1 { return true }
            resultMap[sum] = sum
            result = sum
            sum = 0
        }
        sum += map[result % 10]
        result /= 10
        
    }
    
    return false
}


import XCTest

extension XCTestCase {
    func testIsHappy() {
        assert(isHappy(19) == true)
        assert(isHappy(82) == true)
        let a = Int.max
        assert(isHappy(a) == false)

        assert(isHappy(11) == false)
        assert(isHappy(1) == true)
    }
    
//    func testStackFrame() {
////        _ = stackFrame(40276)
//        _ = stackFrame(40277)
////        _ = stackFrame(40278)
//    }
}


func stackFrame(_ n: Int) -> Int {
    if n < 1 { return 0}
    let a = n + 10
    print("n = \(a)")
    print("n = \(a)")
    return stackFrame(n - 1)
}
