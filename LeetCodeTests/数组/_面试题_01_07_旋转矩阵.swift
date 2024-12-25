//
//  _面试题_01_07_旋转矩阵.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/7.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
func rotate1(_ matrix: inout [[Int]]) {
    let count_1 = matrix.count - 1
    
    let l_matrix = matrix
    // 确定是N*N
    for i in 0...count_1 {
        for j in 0...count_1 {
            matrix[i][j] = l_matrix[count_1 - j][i]
        }
    }
    
//    print("end matrix == \(matrix)")
}

fileprivate
func rotate(_ matrix: inout [[Int]]) {
    
    let count_1 = matrix.count - 1
    var count_1_i = 0
    // 上下翻转
    for i in 0..<(matrix.count >> 1) {
        for j in 0...count_1 {
            count_1_i = count_1 - i
            (matrix[i][j], matrix[count_1_i][j]) = (matrix[count_1_i][j], matrix[i][j])
        }
    }
    
    // 对角翻转
    for i in 0...count_1 {
        for j in 0..<i {
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
    }
}

import XCTest
extension XCTestCase {
    func testRotate() {
        
//      n-1-j i -> i,j
//        i,j -> j,n - 1 - i
//        0,0 -> 0,2
//        0,1 -> 1,2
//        0,2 -> 2,2
//
//        1,0 -> 0,1
//        1,1 -> 1,1
//        1,2 -> 2,1
//
//        2,0 -> 0,0
//        2,1 -> 1,0
//        2,2 -> 2,0
        
        var matrix1 = [
          [1,2,3],
          [4,5,6],
          [7,8,9]
        ]
        
        
        rotate(&matrix1)
        assert(matrix1 == [
          [7,4,1],
          [8,5,2],
          [9,6,3]
        ])
        
        var matrix2 = [
          [ 5, 1, 9,11],
          [ 2, 4, 8,10],
          [13, 3, 6, 7],
          [15,14,12,16]
        ]
        rotate(&matrix2)
        assert(matrix2 == [
          [15,13, 2, 5],
          [14, 3, 4, 1],
          [12, 6, 8, 9],
          [16, 7,10,11]
        ])
    }
}
