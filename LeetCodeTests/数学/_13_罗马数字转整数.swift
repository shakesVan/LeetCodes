//
//  _13_罗马数字转整数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


fileprivate let numberRomanMap: [Character: Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
]

func romanToInt(_ s: String) -> Int {
    var result = 0
    var preNum = 0
    
    for char in s {
        guard let num = numberRomanMap[char] else {
            // 数据异常
            print("数据异常, char = \(char), numberRomanMap = \(numberRomanMap)")
            break
        }
        if preNum < num {
            result += num - preNum * 2
        } else {
            result += num
        }
        preNum = num
    }
    return result
}

func romanToInt2(_ s: String) -> Int {
    var result: Int = 0
    var sa: [Character] = Array(s)
    var tmp: String = ""
    for char in sa {
        if tmp.count == 0 {
            tmp = String(char)
            continue
        }
        let before = tmp
        tmp.append(char)
        if doubleRomanMap[tmp] != nil {
            result += simpleRomanToInt(tmp)
            tmp = ""
        } else {
            result += simpleRomanToInt(before)
            tmp = String(char)
        }
    }
    if tmp.count != 0 {
        result += simpleRomanToInt(tmp)
    }
    
    return result
}


fileprivate let singleRomanMap = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
]

fileprivate let doubleRomanMap = [
    "IV": 4,
    "IX": 9,
    "XL": 40,
    "XC": 90,
    "CD": 400,
    "CM": 900,
]

func romanToInt1(_ s: String) -> Int {
    return slipRomanToSimple(s)
        .reduce(0, { $0 + simpleRomanToInt($1) })
}

func slipRomanToSimple(_ s: String) -> [String] {
    var result: [String] = []
    var sa: [Character] = Array(s)
    var tmp: String = ""
    for char in sa {
        if tmp.count == 0 {
            tmp = String(char)
            continue
        }
        let before = tmp
        tmp.append(char)
        if doubleRomanMap[tmp] != nil {
            result.append(tmp)
            tmp = ""
        } else {
            result.append(before)
            tmp = String(char)
        }
    }
    if tmp.count != 0 {
        result.append(tmp)
    }
    
    return result
}

func simpleRomanToInt(_ s: String) -> Int {
    if let value = doubleRomanMap[s] {
        return value
    }
    
    if let value = singleRomanMap[s] {
        return value
    }
    
    return 0
}

import XCTest

class RomanToIntCase: XCTestCase {
    func testRomanToInt() {
        assert(romanToInt("III") == 3)
        assert(romanToInt("IV") == 4)
               
        assert(romanToInt("IX") == 9)
       
        assert(romanToInt("LVIII") == 58)
       
        assert(romanToInt("MCMXCIV") == 1994)
    }
}
