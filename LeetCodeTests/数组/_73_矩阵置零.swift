//
//  _73_矩阵置零.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/19.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func setZeroes(_ matrix: inout [[Int]]) {
    if matrix.count == 0 || matrix.first?.count == 0 {
        return
    }
    
    var i0Array = [Bool].init(repeating: false, count: matrix.count)
    var j0Array = [Bool].init(repeating: false, count: matrix.first?.count ?? 0)
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if matrix[i][j] == 0 {
                i0Array[i] = true
                j0Array[j] = true
            }
        }
    }
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if i0Array[i] || j0Array[j] {
                matrix[i][j] = 0
            }
        }
    }
}


func setZeroes1(_ matrix: inout [[Int]]) {
    var i0map = [Int: Bool]()
    var j0map = [Int: Bool]()
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if matrix[i][j] == 0 {
                i0map[i] = true
                j0map[j] = true
            }
        }
    }
    
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if i0map[i] != nil || j0map[j] != nil {
                matrix[i][j] = 0
            }
        }
    }
}
