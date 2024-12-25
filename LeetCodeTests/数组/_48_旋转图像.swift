//
//  _48_旋转图像.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/19.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate
func rotate(_ matrix: inout [[Int]]) {
    if matrix.count == 0, matrix[0].count == 0 {
        return
    }
    let count = matrix.count
    let midi = count / 2
    let midj = matrix[0].count / 2
    
    var tmp = 0
    for i in 0..<midi {
        for j in 0..<midj {
            tmp = count - 1 - i
            (matrix[j][i], matrix[i][tmp]) = (matrix[i][tmp], matrix[j][i])
            tmp = count - 1 - tmp
            (matrix[j][i], matrix[i][tmp]) = (matrix[i][tmp], matrix[j][i])
            tmp = count - 1 - tmp
            (matrix[j][i], matrix[i][tmp]) = (matrix[i][tmp], matrix[j][i])
        }
    }
}
