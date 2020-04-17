//
//  _1162_地图分析.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/16.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
/**
 定义状态： dp(i,j) 表示dp(i,j) 距离最近陆地的最大距离
 初始值： 如果grid[i][j] == 1, dp(i,j) = 0
 dp[0][0] = grid[i][j] == 1 ? 0 : 最大值
 dp[i][j] = 最大值
 确认状态转移： dp(i,j)
 grid[i][j] == 1, 则dp(i,j) = 0
 dp(i,j) = min(dp(i-1,j),dp(i,j-1),dp(i+1,j),dp(i,j+1)) + 1
 左上到右下
 dp(i,j) = dp(i-1,j) + 1 // i > 0
 dp(i,j) = min(dp(i,j-1), dp(i,j)) + 1 // j > 0
 右下到左上
 dp(i,j) = min(dp(i+1,j) + 1,dp(i,j)) // i < grid.count-1
 dp(i,j) = min(dp(i,j+1) + 1,dp(i,j)) // j < grid[0].count-1
 */

func maxDistance1(_ grid: [[Int]]) -> Int {
    let maxV = 10000
    let m = grid.count - 1
    let n = m
    var dp = Array(repeating: Array(repeating: maxV, count: n + 1),
                count: m + 1)
    
    dp[0][0] = grid[0][0] == 1 ? 0 : maxV
    
    for i in 0...m {
        for j in 0...n {
            if grid[i][j] == 1 {
                dp[i][j] = 0
            }else {
                if i >= 1 {
                    dp[i][j] = dp[i-1][j] + 1
                }
                if j >= 1 {
                    dp[i][j] = min(dp[i][j], dp[i][j-1] + 1)
                }
                
            }
        }
    }
    
    var result = dp[m][n]
    for i in (0...m).reversed() {
        for j in (0...n).reversed() where grid[i][j] == 0 {
            if i < m {
                dp[i][j] = min(dp[i][j],dp[i+1][j] + 1)
            }
            if j < n {
                dp[i][j] = min(dp[i][j],dp[i][j+1] + 1)
            }
            result = max(result, dp[i][j])
        }
    }
    
//    print("dp ==== \(dp)")
    if result == 0 || result >= maxV { return -1 }
    // 如果大于等于最大初始值表示未找到
    return result;
}

func maxDistance(_ grid: [[Int]]) -> Int {
    
    let m = grid.count - 1
    guard m > 0 else {
        return -1
    }
    let maxV = 10000
    let n = m
    var dp = Array(repeating: Array(repeating: maxV, count: n + 1),
                   count: m + 1)
    
    dp[0][0] = grid[0][0] == 1 ? 0 : maxV
    
    for i in 1...m {
        if grid[i][0] == 1 {
            dp[i][0] = 0
        }else {
            dp[i][0] = dp[i-1][0] + 1
        }
    }
    
    for j in 1...n {
        if grid[0][j] == 1 {
            dp[0][j] = 0
        }else {
            dp[0][j] = dp[0][j-1] + 1
        }
    }
    
    for i in 1...m {
        for j in 1...n {
            if grid[i][j] == 1 {
                dp[i][j] = 0
            }else {
                dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + 1
            }
        }
    }
    
    var result = dp[m][n]
    for i in (0...m).reversed() {
        for j in (0...n).reversed() where grid[i][j] == 0 {
            if i < m {
                dp[i][j] = min(dp[i][j],dp[i+1][j] + 1)
            }
            if j < n {
                dp[i][j] = min(dp[i][j],dp[i][j+1] + 1)
            }
            result = max(result, dp[i][j])
        }
    }
    
//    print("dp ==== \(dp)")
    if result == 0 || result >= maxV { return -1 }
    // 如果大于等于最大初始值表示未找到
    return result;
}

import XCTest

extension XCTestCase {
    
    func testUpdateMatrix1() {
        let a = [[1,0,1],
                 [0,0,0],
                 [1,0,1]]
        
        let b = [[1,0,0],
                 [0,0,0],
                 [0,0,0]]
        let c = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
        let d = [[0,0,1,1,1],[0,1,1,0,0],[0,0,1,1,0],[1,0,0,0,0],[1,1,0,0,1]]
        let e = [[1]]
        let f = [[0]]
        assert(maxDistance(a) == 2)

        assert(maxDistance(b) == 4)
        // 逻辑还有问题
        assert(maxDistance(c) == -1)
        assert(maxDistance(d) == 2)
        assert(maxDistance(e) == -1)
        assert(maxDistance(f) == -1)
    }
}


