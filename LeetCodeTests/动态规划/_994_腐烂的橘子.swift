//
//  _994_腐烂的橘子.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/4.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

/// 思路错了
func orangesRotting(_ grid: [[Int]]) -> Int {
    // dp(i, j), 为改点位橘子被腐烂所需的最小时间
    // 如果原始位置没有橘子则 dp(i, j) = -1,
    // 如果原始位置有腐烂的橘子 dp(i, j) = 0
    // dp(i, j) = min(dp(i, j-1), dp(i-1, j)) + 1, 左上到右下
    // dp(i, j) = min(dp(i, j+1), dp(i+1, j)) + 1, 右下到左上
    
    let n = grid.count
    let m = grid.first?.count ?? 0
    guard m >= 1, n >= 1 else {
        return -1
    }
    if m == 1 && n == 1 {
        return grid[0][0] != 1 ? 0 : -1
    }
    
    let maxValue = m * n
    var dp = Array(repeating: Array(repeating: maxValue, count: m),
                   count: n)
    
    var result = 0
    for _ in 0..<(n+m)/2 {
        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == 0 {
                    dp[i][j] = maxValue
                    continue
                }
                if grid[i][j] == 2 {
                    dp[i][j] = 0
                    continue
                }
                
                var tmp = dp[i][j]
                if i == 0 && j == 0 {
                    // 左上角
                    tmp = maxValue
                } else if i == 0 {
                    // 最上一行
                    tmp = dp[i][j-1] + 1
                } else if j == 0 {
                    // 最左一列
                    tmp = dp[i-1][j] + 1
                    
                } else {
                    tmp = min(dp[i][j-1], dp[i-1][j]) + 1
                }
                dp[i][j] = min(dp[i][j], tmp)
                
            }
        }
        
        print("part1 dp = \(dp)")
        result = 0
        for i in (0..<n).reversed() {
            for j in (0..<m).reversed() {
                
                if grid[i][j] == 0 {
                    dp[i][j] = maxValue
                    continue
                }
                if grid[i][j] == 2 {
                    dp[i][j] = 0
                    continue
                }
                
                var tmp = dp[i][j]
                // 右下角
                if i == n - 1 && j == m - 1 {
                    tmp = maxValue
                    
                } else if i == n - 1 {
                    // 最下一行
                    tmp = dp[i][j+1] + 1
                    
                } else if j == m - 1 {
                    // 最右一列
                    tmp = dp[i+1][j] + 1
                    
                } else {
                    tmp = min(dp[i][j+1], dp[i+1][j]) + 1
                }
                dp[i][j] = min(dp[i][j], tmp)
                result = max(dp[i][j], result)
                
                print("parti == \(i), j == \(j), dp[i][j] = \(dp[i][j]), result = \(result)")
            }
        }
    }
    print("part2 dp = \(dp), result = \(result)")
    result = result >= maxValue ? -1 : result
    return result
}
