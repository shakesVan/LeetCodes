//
//  5404. 用栈操作构建数组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/10.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/weekly-contest-188/problems/build-an-array-with-stack-operations/

import Foundation

private
func buildArray(_ target: [Int], _ n: Int) -> [String] {
    let push = "Push"
    let pop = "Pop"
    var arr = [String]()
    var t = 1
    var idx = 0
    while t <= n && idx < target.count {
        
//        print("t = \(t), n = \(n)")
        if target[idx] == t {
            arr.append(push)
            idx += 1
            t += 1
        }else {
            arr.append(push)
            arr.append(pop)
            t += 1
        }
//        print("arr = \(arr)")
    }
    
    
    return arr
}

import XCTest

extension XCTestCase {
    func testBuildArray() {
        assert(buildArray([1,3], 3) == ["Push","Push","Pop","Push"])
        assert(buildArray([1,2,3], 3) == ["Push","Push","Push"])
        assert(buildArray([1,2], 4) == ["Push","Push"])
        assert(buildArray([2,3,4], 4) == ["Push","Pop","Push","Push","Push"])
        
        
    }
}
