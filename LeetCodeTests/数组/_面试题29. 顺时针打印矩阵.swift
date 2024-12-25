//
//  _面试题29. 顺时针打印矩阵.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/6.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class Solution {
    enum Direction: Int {
        case right = 0
        case down = 1
        case left = 2
        case up = 3

        static func turnRight(_ e: inout Direction) {
            if e == .up { return e = .right }
            e = Direction(rawValue: e.rawValue + 1)!
//            Set().contains(<#T##member: _##_#>)
        }
        

        func move(_ row: inout Int, _ col: inout Int) {
            switch self {
                case .right: col += 1
                case .left: col -= 1
                case .up: row -= 1
                case .down: row += 1
            }
        }
    }
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var dir = Direction.right
        var minRow = 0
        var maxRow = matrix.count - 1
        var minCol = 0
        var maxCol = matrix[0].count - 1
        var row = 0
        var col = 0
        var ans = [Int]()
        while minRow <= maxRow && minCol <= maxCol {
            ans.append(matrix[row][col])
            switch dir {
            case .right: if col == maxCol {
                    Direction.turnRight(&dir)
                    minRow += 1
                }
            case .left: if col == minCol {
                    Direction.turnRight(&dir)
                    maxRow -= 1
                }
            case .up: if row == minRow {
                Direction.turnRight(&dir)
                minCol += 1
                }
            case .down: if row == maxRow {
                Direction.turnRight(&dir)
                maxCol -= 1
                }
            }
//            print("dir = \(dir), row = \(row), col = \(col), minR = \(minRow), maxR = \(maxRow), maxC = \(maxCol), minC = \(minCol)")
            dir.move(&row,&col)
        }
//        print(ans)
        return ans
    }
}
import XCTest

extension XCTestCase {
    func testspiralOrder() {

        let s = Solution()
        var matrix = [[1,2,3],[4,5,6],[7,8,9]]
        assert(s.spiralOrder(matrix) == [1,2,3,6,9,8,7,4,5])
        
        matrix = [[1]]
        assert(s.spiralOrder(matrix) == [1])
        
        matrix = [[1, 2], [3, 4]]
        assert(s.spiralOrder(matrix) == [1, 2, 4, 3])
        
        matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
        assert(s.spiralOrder(matrix) == [1,2,3,4,8,12,11,10,9,5,6,7])
    }
}
