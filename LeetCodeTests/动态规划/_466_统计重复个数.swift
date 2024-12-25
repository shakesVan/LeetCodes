//
//  _466_统计重复个数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/19.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/count-the-repetitions/submissions/

import Foundation

// 测试失败
func getMaxRepetitions(_ s1: String, _ n1: Int, _ s2: String, _ n2: Int) -> Int {
    
    var text1 = ""
    for _ in 0..<n1 {
        text1 += s1
    }
    
    var text2 = ""
    for _ in 0..<n2 {
        text2 += s2
    }
    
    let cs = longestCommonSubsequence(text1, text2)
    
    return cs / s2.count
}

// 未完成
func getMaxRepetitions1(_ s1: String, _ n1: Int, _ s2: String, _ n2: Int) -> Int {
    
    let maxD = getMaxDivisor(n1, n2)
    let times1 = n1 / maxD
//    let times2 = n2 / maxD
    print("maxD === \(maxD)")
    
    var text1 = ""
    for i in 1...times1 {
        text1 += s1

        print("text1 == \(text1)")
        let cs = longestCommonSubsequence(text1, s2)
        if cs == s2.count {
            print("i == \(i)")
            let result = times1 / i
//            let result = n1 / i / maxD
            print("result == \(result)")
            // s1的次数，除以当前次数i，表示能重复次数，* 最大公因数
            return result
        }
    }
    print("text1 == \(text1)")
    
    return 0
}

private
func getMaxDivisor(_ n1: Int, _ n2: Int) -> Int {
    if n2 == 0 { return n1 }
    if n1 > n2 {
        return getMaxDivisor(n2, n1 % n2)
    }
    return getMaxDivisor(n2, n2 % n1)
}

// 1维数组
//func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
//
//    var rows = Array(text1)
//    var cols = Array(text2)
//    guard rows.count > 0 && rows.count > 0 else {
//        return 0
//    }
//    if cols.count > rows.count {
//        cols = Array(text1)
//        rows = Array(text2)
//    }
//
//
//    var dp = Array(repeating: 0, count: cols.count + 1)
//
//    var leftTop = 0
//    for row in 1...rows.count {
//        leftTop = 0
//        for col in 1...cols.count {
//            let cur = leftTop
//            leftTop = dp[col]
//            if cols[col-1] == rows[row-1] {
//                dp[col] = cur + 1
//            }else {
//                dp[col] = max(dp[col],dp[col-1])
//            }
//        }
////        print("i == \(row), dp == \(dp)")
//    }
//
//    return dp[cols.count]
//}


import XCTest

extension XCTestCase {
    func testGetMaxRepetitions() {
        assert(getMaxRepetitions("abc", 4,"ab", 2) == 2)
        assert(getMaxRepetitions("acb", 4,"ab", 2) == 2)
        // abcabcabcabc
        // abb
        // abbabb
        assert(getMaxRepetitions("abc", 4,"abb", 2) == 1)
        assert(getMaxRepetitions("abc", 2,"abb", 1) == 1)
        assert(getMaxRepetitions("abcabc", 1,"abb", 1) == 1)
        assert(getMaxRepetitions("aaa", 3,"aa", 1) == 4)
        
    }
    
    
    func testGetMaxDivisor() {
        assert(getMaxDivisor(4,2) == 2)
        assert(getMaxDivisor(4,3) == 1)
        
        assert(getMaxDivisor(12,8) == 4)
    }
}
