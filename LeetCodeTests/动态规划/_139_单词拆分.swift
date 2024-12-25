//
//  _139_单词拆分.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/6.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    
    let array: [String] = Array(s).map { String($0) }
    
    var dict: [String: Bool] = [:]
    wordDict.forEach {
        dict[$0] = true
    }
    if dict[s] ?? false {
        return true
    }
    // 定义：     dp(0)(n) 前n个字符是否可以被拆分
    // 初始化：   dp(0)(0) = true, dp(0)(1) = dict[array[0]]
    // 状态转移： dp(0)(n) = dp(0)(i) & dp(i+1)(n) , i遍历0到n-1，有一个为true即为true
    //                   = dict[array[0..<i]] && dict[array[i..<n]]
    let n = array.count
    var dp: [Bool] = Array.init(repeating: false, count: n+1)
    dp[0] = true
    
    for i in 1...n {
        for j in 0..<i {
            let right: String = String(array[j..<i].reduce("", { $0 + $1 }))
            if dp[j] && (dict[right] ?? false) {
                dp[i] = true
                break
            }
        }
    }
    
    return dp.last ?? false
}
