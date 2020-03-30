//
//  _面试题62_圆圈中最后剩下的数字.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/30.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof/

import Foundation


func lastRemaining(_ n: Int, _ m: Int) -> Int {
    var curr = 0
    
    for i in 2...n {
        curr = (curr + m) % i
    }
    return curr
}

func lastRemaining1(_ n: Int, _ m: Int) -> Int {
    var arr = Array(0..<n)
    var count = arr.count
    var curr = 0
    while count > 1 {
        curr = (curr + m -  1) % count
        let rm = arr.remove(at: curr)
//        curr += 1
        print("curr == \(curr)")
        print("rm == \(rm)")
        count -= 1
    }
    print("arr == \(arr)")
    
    return arr[0]
}


import XCTest
extension XCTestCase {
    func testLastRemaining() {
//        lastRemaining(5, 3)
        assert(lastRemaining(5, 3) == 3)
        assert(lastRemaining(5, 2) == 2)

        assert(lastRemaining(10, 17) == 2)

//        assert(lastRemaining(1, 1) == 0)

        assert(lastRemaining(2, 1) == 1)
    }
}


