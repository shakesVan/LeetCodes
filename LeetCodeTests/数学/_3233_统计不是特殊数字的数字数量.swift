//
//  _3233_统计不是特殊数字的数字数量.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/23.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

// 题目可能有问题
func nonSpecialCount(_ l: Int, _ r: Int) -> Int {
    // 计算特殊数字的数量，即能完整开根号的数
    let max = Int(sqrt(Double(r) - 0.5))
    let min = Int(sqrt(Double(l) + 0.5))
    
    var result: Int
    if max < min {
        result = r - l - 1
    } else {
        result = r - l - 1 - (max - min + 1)
    }
    
    if Int(sqrt(Double(r))) * Int(sqrt(Double(r))) != r {
        result += 1
    }
                                  
    if Int(sqrt(Double(l))) * Int(sqrt(Double(l))) != l || l == 1 {
        result += 1
    }
    
    return result
}
