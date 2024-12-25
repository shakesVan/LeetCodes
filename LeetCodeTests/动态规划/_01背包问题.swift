//
//  _01背包问题.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/17.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
import XCTest
/**
 定义dp： dp(i,j) 表示前i件物品可以选，最大重量为j的最大价值
 初始值：dp(0,j) = 0 无物可选, dp(i,0) = 0 无重可拿
 状态转移方程：
 如果不拿了第i件物品，则 dp(i,j) = dp(i-1,j）
 如果拿了第i件物品，则 dp(i,j) = dp(i-1,j - weights[i-1]) + values[i-1]
 dp(i, j) = max(dp(i-1,j), dp(i-1,j - weights[i-1]) + values[i-1])
 */

// 刚好装满,返回-1表示未找到
private
func maxValueExactly(_ weights: [Int], _ values: [Int], maxWeight: Int) -> Int {
    guard maxWeight > 0 else {
        return 0;
    }
    let m = weights.count
   
    guard m == values.count && m > 0 else {
        return 0
    }
    
    var dp = Array(repeating: Int.min, count: maxWeight + 1)
    dp[0] = 0
    for i in 1...m {
        if maxWeight < weights[i-1] { continue }
        for j in (weights[i-1]...maxWeight).reversed() {
            dp[j] = max(dp[j], dp[j - weights[i-1]] + values[i-1])
                
        }
    }
//    print(dp)
    return dp[maxWeight] < 0 ? -1 : dp[maxWeight]
}

// 1维数组
func maxValue(_ weights: [Int], _ values: [Int], maxWeight: Int) -> Int {
    guard maxWeight > 0 else {
        return 0;
    }
    let m = weights.count
   
    guard m == values.count && m > 0 else {
        return 0
    }
    
    var dp = Array(repeating: 0, count: maxWeight + 1)
    
    for i in 1...m {
        for j in (weights[i-1]...maxWeight).reversed() {
            dp[j] = max(dp[j], dp[j - weights[i-1]] + values[i-1])
                
        }
    }
//    print(dp)
    return dp[maxWeight]
}
// 滚动数组
func maxValue2(_ weights: [Int], _ values: [Int], maxWeight: Int) -> Int {
    guard maxWeight > 0 else {
        return 0;
    }
    let m = weights.count
   
    guard m == values.count && m > 0 else {
        return 0
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: maxWeight + 1), count: 2)
    
    var index = 0
    var _1_index = 1
    for i in 1...m {
        index = i & 1
        _1_index = 1 - index
        for j in 1...maxWeight {
            let k = j - weights[i-1]
            if k < 0 {
                dp[index][j] = dp[_1_index][j]
            }else {
                dp[index][j] = max(dp[_1_index][j], dp[_1_index][k] + values[i-1])
                
            }
        }
    }
    
    return dp[index][maxWeight]
}

// 2维数组
func maxValue1(_ weights: [Int], _ values: [Int], maxWeight: Int) -> Int {
    guard maxWeight > 0 else {
        return 0;
    }
    let m = weights.count
   
    guard m == values.count && m > 0 else {
        return 0
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: maxWeight + 1), count: m + 1)
    
    for i in 1...m {
        for j in 1...maxWeight {
            let k = j - weights[i-1]
            if k < 0 {
                dp[i][j] = dp[i-1][j]
            }else {
                dp[i][j] = max(dp[i-1][j], dp[i-1][k] + values[i-1])
                
            }
        }
    }
//    print(dp)
    
    return dp[m][maxWeight]
}

extension XCTestCase {
    func testMaxValue() {
        let v1 = [1, 4, 2]
        let w1 = [1, 2, 4]
        
        let v2 = [6, 3, 5, 4, 6]
        let w2 = [2, 2, 6, 5, 4]
        
        assert(maxValue(w1, v1, maxWeight: 4) == 5)
        assert(maxValue(w2, v2, maxWeight: 10) == 15)
        assert(maxValue(w2, v2, maxWeight: 0) == 0)
    }
    func testMaxValueExactly() {
        let v1 = [1, 4, 2]
        let w1 = [1, 2, 4]
        
        let v2 = [6, 3, 5, 4, 6]
        let w2 = [2, 2, 6, 5, 4]
        
        assert(maxValueExactly(w1, v1, maxWeight: 4) == 2)
        assert(maxValueExactly(w2, v2, maxWeight: 10) == 14)
        assert(maxValueExactly(w2, v2, maxWeight: 0) == 0)
        assert(maxValueExactly(w2, v2, maxWeight: 1) == -1)
    }
}


