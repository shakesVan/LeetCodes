//
//  _46_全排列.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/25.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/permutations/

import Foundation

fileprivate
func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]()]
    // 初始化为一个空值
    var prev: [[Int]]
    // 当前Int数组
    var cur: [Int]
    // 遍历nums中的每一个元素
    for num in nums {
        // 每轮循环前，用prev装旧值，result清空
        prev = result
        result = [[Int]]()
        // 遍历旧值
        for i in 0..<prev.count {
            
            // 尝试插入到 previ 中的每一项中去
            for j in 0...prev[i].count {
                cur = prev[i]
                if j < cur.count {
                    cur.insert(num, at: j)
                }else {
                    cur.append(num)
                }
                result.append(cur)
                print("cur === \(cur),num = \(num), i = \(i), j = \(j)")
            }
            // 添加
            print("result === \(result)")
        }
        
    }
    return result
}

extension Int {
    var factorial: Int {
        var result = 1
        for i in 1...self {
            result *= i
        }
        return result
    }
}

import XCTest

extension XCTestCase {
    func testPermute() {
        
//        let l0 = [1]
//        assert(permute(l0).count == l0.count)
//        let l01 = [1]
//        assert(permute(l01).count == l01.count)
        let l1 = [1,2,3]
        assert(permute(l1).count == l1.count.factorial)
//        let l2 = [5,4,6,2]
//        assert(permute(l2).count == l2.count.factorial)
        
    }
}
