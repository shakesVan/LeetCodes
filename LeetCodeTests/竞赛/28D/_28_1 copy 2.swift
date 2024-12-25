//
//  _28_1.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/13.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class SubrectangleQueries {

    private var _rectangle: [[Int]]
    init(_ rectangle: [[Int]]) {
        _rectangle = rectangle
    }
    
    func updateSubrectangle(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int, _ newValue: Int) {
        for row in row1...row2 {
            for col in col1...col2 {
                _rectangle[row][col] = newValue
            }
        }
        
    }
    
    func getValue(_ row: Int, _ col: Int) -> Int {
        return _rectangle[row][col]
    }
}

/**
 * Your SubrectangleQueries object will be instantiated and called as such:
 * let obj = SubrectangleQueries(rectangle)
 * obj.updateSubrectangle(row1, col1, row2, col2, newValue)
 * let ret_2: Int = obj.getValue(row, col)
 */
