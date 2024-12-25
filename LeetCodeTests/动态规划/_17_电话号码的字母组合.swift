//
//  _17_电话号码的字母组合.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/3.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate let numMap: [String: [String]] = [
    "2": ["a", "b", "c"],
    "3": ["d", "e", "f"],
    "4": ["g", "h", "i"],
    "5": ["j", "k", "l"],
    "6": ["m", "n", "o"],
    "7": ["p", "q", "r", "s"],
    "8": ["t", "u", "v"],
    "9": ["w", "x", "y", "z"]
]


func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 {
        return []
    }
    
    let chars: [String] = Array(digits).map { String($0) }
    // dp(n)为n之前的目标数组，n为0，无之前特殊处理
    // dp(0) = [""]
    // dp(1) = dp(0)中各字符串 各自拼接 第0个字母对应的char数组
    // dp(n) = dp(n-1)中各项 分别拼接 numMap[char[n-1]] （两个for循环）
    
    var dp = [""]
    var tmp = [String]()
    for char in chars {
        tmp = []
        for befer in dp {
            tmp.append(contentsOf: (numMap[char] ?? []).map { befer + $0 })
//            print("tmp == \(tmp), befer = \(befer), char = \(char)")
        }
        
//        print("tmp == \(tmp), dp = \(dp), char = \(char)")
        dp = tmp
    }
//    print("result == \(dp)")
    return dp
}
