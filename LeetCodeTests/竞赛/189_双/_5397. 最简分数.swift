//
//  _5397. 最简分数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/16.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/biweekly-contest-26/problems/simplified-fractions/

import Foundation
private
class Solution {
    
    func simplifiedFractions(_ n: Int) -> [String] {
        guard n > 1 else { return [] }
        var result = [String]()
        for i in 2...n {
            for j in 1..<i {
                if !isHasDivisor(i, j) {
                    result.append("\(j)/\(i)")
                }
            }
        }
        
        return result
    }
    
    // 辗转相除
}


/// 是否含有最大公因数
func isHasDivisor(_ n1: Int, _ n2: Int) -> Bool {
    if getMaxDivisor(n1, n2) > 1 { return true }
    return false
}

private
func getMaxDivisor(_ n1: Int, _ n2: Int) -> Int {
    if n2 == 0 { return n1 }
    if n1 > n2 {
        return getMaxDivisor(n2, n1 % n2)
    }
    return getMaxDivisor(n2, n2 % n1)
}

import XCTest

extension XCTestCase {
    func testSimplifiedFractions() {
        let s = Solution()
        assert(s.simplifiedFractions(2) == ["1/2"])
        assert(s.simplifiedFractions(3) == ["1/2","1/3","2/3"])
        assert(s.simplifiedFractions(4).count == ["1/2","1/3","1/4","2/3","3/4"].count)
        assert(s.simplifiedFractions(1) == [])
    }
}
