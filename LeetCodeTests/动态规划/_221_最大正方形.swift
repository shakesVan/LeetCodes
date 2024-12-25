//
//  _221_最大正方形.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/8.
//  Copyright © 2020, 范摇. All rights reserved.
// https://leetcode-cn.com/problems/maximal-square/

import Foundation

private
class Solution {
    static
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        /**
         定义：dp(i,j)表示以第i行第j列结尾的最大 正方形的边长, i 从 0 到 matrix.count, j 从 0 到 matrix[0].count
         初始值：dp(0,j) = 0,dp(i,0) = 0
         状态转移：dp(i,j) =
         if matrix(i,j) == 0 { dp(i,j) == 0 }
         
         dp(i,j) = min {dp(i-1,j-1) + 1, dp(i-1,j), dp(i, j- 1) }
         
         */
        
        guard matrix.count > 0 else { return 0 }
        guard matrix[0].count > 0 else { return 0 }
        
        var maxWidth = 0
        // 最小值设置为 列
        
        var rows = matrix.count
        var cols = matrix[0].count
        var flag = false
        if matrix.count > matrix[0].count {
            flag = true
            rows = matrix[0].count
            cols = matrix.count
        }
        // 一维s数组
        var dp = Array(repeating: 0, count: cols + 1)
        
        for row in 1...rows {
            
            var leftTop = 0
            for col in 1...cols {
                if flag {
                   if matrix[col - 1][row - 1] == "0" {
                       dp[col] = 0
                       continue
                   }
                }else if matrix[row - 1][col - 1] == "0" {
                    dp[col] = 0
                    continue
                }
                
                let tmp = leftTop
                leftTop = dp[col]
                // 左上角的值需要保留
                dp[col] = min(tmp, min(dp[col], dp[col - 1])) + 1
                maxWidth = max(maxWidth, dp[col])
//                print("col = \(col), dp = \(dp[col])")
                
            }
//            print("row = \(row), maxWidth = \(maxWidth)")
        }
        return maxWidth * maxWidth
    }
    func maximalSquare2(_ matrix: [[Character]]) -> Int {
        /**
         定义：dp(i,j)表示以第i行第j列结尾的最大 正方形的边长, i 从 0 到 matrix.count, j 从 0 到 matrix[0].count
         初始值：dp(0,j) = 0,dp(i,0) = 0
         状态转移：dp(i,j) =
         if matrix(i,j) == 0 { dp(i,j) == 0 }
         
         dp(i,j) = min {dp(i-1,j-1) + 1, dp(i-1,j), dp(i, j- 1) }
         
         */
        
        guard matrix.count > 0 else { return 0 }
        var maxWidth = 0
        var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count + 1), count: 2)
        var rowIdx = 0
        for row in 1...matrix.count {
            rowIdx = row & 1
            let cols = matrix[row - 1]
            for col in 1...cols.count {
                if matrix[row - 1][col - 1] == "0" {
                    dp[rowIdx][col] = 0
                    continue
                }
                dp[rowIdx][col] = min(dp[1 - rowIdx][col - 1], min(dp[1 - rowIdx][col], dp[rowIdx][col - 1])) + 1
                maxWidth = max(maxWidth, dp[rowIdx][col])
            }
        }
        return maxWidth * maxWidth
    }
        
    func maximalSquare1(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 else { return 0 }
        /**
         定义：dp(i,j)表示以第i行第j列结尾的最大 正方形的边长, i 从 0 到 matrix.count, j 从 0 到 matrix[0].count
         初始值：dp(0,j) = 0,dp(i,0) = 0
         状态转移：dp(i,j) =
         if matrix(i,j) == 0 { dp(i,j) == 0 }
         
         dp(i,j) = min {dp(i-1,j-1) + 1, dp(i-1,j), dp(i, j- 1) }
         
         */
        var maxWidth = 0
        var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)
        for row in 1...matrix.count {
            let cols = matrix[row - 1]
            for col in 1...cols.count {
                if matrix[row - 1][col - 1] == "0" {
                    dp[row][col] = 0
                    continue
                }
                dp[row][col] = min(dp[row - 1][col - 1], min(dp[row - 1][col], dp[row][col - 1])) + 1
                maxWidth = max(maxWidth, dp[row][col])
            }
        }
        return maxWidth * maxWidth
    }
}

import XCTest

extension XCTestCase {
    func testMaximalSquare() {
//        let matrix: [[Character]] = [["1", "0", "1", "0", "0"],
//                                     ["1", "0", "1", "1", "1"],
//                                     ["1", "1", "1", "1", "1"],
//                                     ["1", "0", "0", "1", "0"]]
//        assert(Solution.maximalSquare(matrix) == 4)
        
    let matrix2: [[Character]] = [
        ["1","1","1","1","1","1","0","1","1","1","1","1","1","1","1"],["1","0","1","1","0","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","1","1","0","1","1","1","0","1","1","1"],["1","0","0","1","1","1","1","1","1","1","1","0","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","0","1","1","1","1","1","1","1","0","1","1","1"],["1","1","1","1","0","0","0","1","1","1","1","1","0","1","0"],["1","0","1","1","0","0","0","1","1","1","1","0","1","0","1"],["1","0","1","1","1","1","1","1","0","1","1","1","0","1","1"],["1","0","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","0","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","0","0","0","1","0","1","1","1","1","1","1","1"],["1","1","1","1","1","1","0","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","0","1","1","1","1","1","0","1"]]

        assert(Solution.maximalSquare(matrix2) == 25)
    }

}
