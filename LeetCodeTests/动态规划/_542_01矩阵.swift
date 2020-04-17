//
//  _542_01矩阵.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/15.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
/**
 定义状态 dp(i,j) 表示dp(i,j)最近的 0 的距离
 初始值 dp(0,0) = (matrix[0][0] == 0 ? 0 : 10000)
 状态转移 dp(i,j)
 如果为0，则为0
 如果不为0，则，min(dp(i-1,j),dp(i, j-1),dp(i+1,j),dp(i,j+1)) + 1
 */
func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
    let max = 10000
    let m = matrix.count - 1
    let n = matrix[0].count - 1
    var dp = Array(repeating: Array(repeating: max, count: n + 1),
                   count: m + 1)
    
    dp[0][0] = matrix[0][0] == 0 ? 0 : 10000
    dp[m][n] = matrix[m][n] == 0 ? 0 : 10000

    for i in 0...m {
        
        for j in 0...n {
            if matrix[i][j] == 0 {
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
    
    for i in (0...m).reversed() {
        for j in (0...n).reversed() {
            if matrix[i][j] == 0 { continue }
            if i < m {
                dp[i][j] = min(dp[i][j],dp[i+1][j] + 1)
            }
            if j < n {
                dp[i][j] = min(dp[i][j],dp[i][j+1] + 1)
            }
        }
    }
    
    return dp;
}


import XCTest

extension XCTestCase {
    func testUpdateMatrix() {
        let a = [[0,0,0],
                 [0,1,0],
                 [0,0,0]]
        let ar = [[0,0,0],
                  [0,1,0],
                  [0,0,0]]
        
        let b = [[0,0,0],
                 [0,1,0],
                 [1,1,1]]
        let br = [[0,0,0],
                  [0,1,0],
                  [1,2,1]]
        assert(updateMatrix(a) == ar)
        
        assert(updateMatrix(b) == br)
    }
    
}



