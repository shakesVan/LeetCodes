//
//  _892_三维形体的表面积.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/25.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/surface-area-of-3d-shapes/

import Foundation
import XCTest

func surfaceArea(_ grid: [[Int]]) -> Int {
    var deepSum = 0
    
    var itemCount = 0
    let count_1 = grid.count - 1
    for i in 0...count_1 {
        for j in 0...count_1 {
            let item = grid[i][j]
            if item == 0 { continue }
            itemCount += item
            // 自己遮挡自己
            let deepS = ((item - 1) << 1)
            
            // 中心块的四个邻居遮挡
            let n_i_1_j = i == 0 ? 0 : min(item, grid[i - 1][j])
            let n_i_j_1 = j == 0 ? 0 : min(item, grid[i][j - 1])
            
            let n_i1_j = i == count_1 ? 0 : min(item, grid[i + 1][j])
            let n_i_j1 = j == count_1 ? 0 : min(item, grid[i][j + 1])
            
            
            deepSum += n_i_1_j + n_i1_j + n_i_j_1 + n_i_j1 + deepS
//            deepSum += min(item, n_i_1_j) + min(item, n_i1_j) + min(item, n_i_j_1) + min(item, n_i_j1)
        }
    }
//    print("deepSum == \(deepSum)")
    return (itemCount << 2) + (itemCount << 1) - deepSum
}

extension XCTestCase {
    func testSurfaceArea() {
//        print(surfaceArea([[2]]))
        assert(surfaceArea([[2]]) == 10)
        
        assert(surfaceArea([[1,2],[3,4]]) == 34)
        
        assert(surfaceArea([[1,0],[0,2]]) == 16)
        
        assert(surfaceArea([[1,1,1],[1,0,1],[1,1,1]]) == 32)
        
        assert(surfaceArea([[2,2,2],[2,1,2],[2,2,2]]) == 46)
    }
}
