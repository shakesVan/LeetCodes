//
//  _54_螺旋矩阵.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/19.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate
typealias BeginEndTuple = (left: Int, right: Int, top: Int, bottom: Int)

fileprivate
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    if matrix.count == 0 && matrix.first?.count == 0 {
        return []
    }
    
    var result = [Int]()
    spiralOrder(matrix, edge: (
        left: 0,
        right: matrix[0].count,
        top: 0,
        bottom: matrix.count),
                result: &result)
    return result
}


fileprivate
func spiralOrder(_ matrix: [[Int]], edge: BeginEndTuple, result: inout [Int]) {
    
    print("edge = \(edge), matrix = \(matrix)")
    if edge.top == edge.bottom - 1,
        edge.left == edge.right - 1 {
        result.append(matrix[edge.top][edge.left])
        return
    }
    
    if edge.top >= edge.bottom || edge.left >= edge.right {
        return
    }

    for j in edge.left..<edge.right {
        result.append(matrix[edge.top][j])
    }
    
    if edge.top + 1 >= edge.bottom {
        return
    }

    for i in (edge.top+1)..<edge.bottom {
        result.append(matrix[i][edge.right-1])
    }

    
    if edge.left >= edge.right - 1 {
        return
    }
    
    for j in (edge.left..<(edge.right-1)).reversed() {
        result.append(matrix[edge.bottom-1][j])
    }

    
    if edge.top + 1 >= edge.bottom - 1 {
        return
    }
    for i in ((edge.top+1)..<(edge.bottom-1)).reversed() {
        result.append(matrix[i][edge.left])
    }
    
    print("result = \(result)")
    spiralOrder(matrix, edge: (
        left: edge.left + 1,
        right: edge.right - 1,
        top: edge.top + 1,
        bottom: edge.bottom - 1),
                result: &result)
    
}
