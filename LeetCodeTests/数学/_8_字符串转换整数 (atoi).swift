//
//  _8_字符串转换整数 (atoi).swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/3.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/string-to-integer-atoi/

import Foundation

func myAtoi(_ str: String) -> Int {
    guard str.count > 0 else {
        return 0
    }
    let strA = Array(str)
    var i = 0
    let count_1 = str.count - 1
    // 去除头部空格
    while i < count_1 && strA[i] == " " {
        i += 1
    }
    if i > count_1 { return 0 }
    
    // 处理符号
    var negative = false
    if strA[i] == "+" {
        i += 1
    }else if strA[i] == "-" {
        i += 1
        negative = true
    }
    // 去除头部0
    while i < count_1 && strA[i] == "0" {
        i += 1
    }
    if i > count_1 { return 0 }
    
    var sum: Int64 = 0

    let ascii0 = Character("0").asciiValue!
    let ascii9 = Character("9").asciiValue!
    // int32 的最大值 是21 4748 3647，不超过11位，所以如果strA.count过大，最多只需要循环11次
    for j in i..<min(strA.count, i+11)  {
        guard let asc = strA[j].asciiValue,
            asc >= ascii0 && asc <= ascii9 else {
                break
        }
        sum = sum * 10 + Int64(asc - ascii0)
    }
    
    // 设置正负号
    if negative {
        sum = -sum
    }
    
    // 防止越界
    let intMax: Int64 = 1 << 31
    if sum > (intMax - 1) {
        sum = intMax - 1
    } else if sum < -intMax {
        sum = -intMax
    }
    
//    print("sum == \(sum)")
    return Int(sum)
}

import XCTest
extension XCTestCase {
    func testMyAtoi() {
//        myAtoi("20000000000000000000")
        assert(myAtoi("20000000000000000000") == 2147483647)
        assert(myAtoi("  0000000000012345678") == 12345678)
        assert(myAtoi("42") == 42)
        assert(myAtoi("4") == 4)
        assert(myAtoi("    -42") == -42)
        assert(myAtoi("4193 with words") == 4193)
        assert(myAtoi("words and 987") == 0)
        assert(myAtoi("-91283472332") == -2147483648)
        assert(myAtoi(" ") == 0)
        assert(myAtoi("+") == 0)
        assert(myAtoi("-") == 0)
        assert(myAtoi("- ") == 0)
        assert(myAtoi("+ ") == 0)
        
        assert(myAtoi("+q") == 0)
        
    }
}
