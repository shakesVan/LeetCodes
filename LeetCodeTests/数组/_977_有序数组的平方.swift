//
//  _977_有序数组的平方.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/1.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
func sortedSquares(_ A: [Int]) -> [Int] {
    var left = 0
    var right = A.count - 1
    var index = right
    var result = Array.init(repeating: 0, count: A.count)
    var leftP: Int
    var rightP: Int
    while left <= right {
        leftP = A[left] * A[left]
        rightP = A[right] * A[right]
        if leftP >= rightP {
            result[index] = leftP
            left += 1
        }else {
            result[index] = rightP
            right -= 1
        }
        index -= 1
    }
    
    return result
}

func sortedSquares1(_ A: [Int]) -> [Int] {
    var left = 0
    var right = A.count - 1
    var index = right
    var result = Array.init(repeating: 0, count: A.count)
    while left <= right {
        
        if abs(A[left]) > abs(A[right]) {
            result[index] = A[left] * A[left]
            left += 1
        }else {
            result[index] = A[right] * A[right]
            right -= 1
        }
        index -= 1
    }
    
    return result
}

import XCTest

extension XCTestCase {
    func testSortedSquares() {
        assert(sortedSquares([-4,-1,0,3,10]) == [0,1,9,16,100])
        assert(sortedSquares([-7,-3,2,3,11]) == [4,9,9,49,121])
        assert(sortedSquares([-10_000,-3,2,3,10_000]) == [4,9,9,100_000_000,100_000_000])
        
    }
}

