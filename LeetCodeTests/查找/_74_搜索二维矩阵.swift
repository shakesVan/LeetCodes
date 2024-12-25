//
//  _74_搜索二维矩阵.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/5.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard let n = matrix.first?.count else {
        return false
    }
    let m = matrix.count
    if m == 1, n == 1 {
        return matrix[0][0] == target
    }
    
    var left = 0
    var right = m * n
    var mid = (left + right) / 2
    while left < right - 1 {
        let index = (mid / n, mid % n)
        if matrix[index.0][index.1] == target {
            return true
        }
        
        if matrix[index.0][index.1] > target {
            right = mid
        } else {
            left = mid
        }
        mid = (left + right) / 2
        print("left = \(left), right = \(right), mid = \(mid) target = \(target)")
    }
    
    let index = (mid / n, mid % n)
    return matrix[index.0][index.1] == target
    
}
