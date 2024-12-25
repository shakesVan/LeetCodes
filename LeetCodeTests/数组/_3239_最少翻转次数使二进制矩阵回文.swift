//
//  _3239_最少翻转次数使二进制矩阵回文.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/18.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/minimum-number-of-flips-to-make-binary-grid-palindromic-i/

import Foundation

func minFlips(_ grid: [[Int]]) -> Int {
    var result = 0
    if grid.count <= 1 {
        return 0
    }
    if grid[0].count <= 1 {
        return 0
    }
    
    let countj = grid[0].count
    let midj = countj / 2
    for i in 0..<grid.count {
        for j in 0..<midj {
            print("countj = \(countj), i = \(i), j = \(j)")
            result += grid[i][j] ^ grid[i][countj - 1 - j]
        }
    }
    
    var tmp = 0
    let counti = grid.count
    let midi = counti / 2
    
    for i in 0..<midi {
        for j in 0..<grid[i].count {
            print("counti = \(counti), i = \(i), j = \(j)")
            tmp += grid[i][j] ^ grid[counti - 1 - i][j]
        }
    }
    
    result = min(result, tmp)
    
    return result
}
