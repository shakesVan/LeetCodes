//
//   _999_车的可用捕获量.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/26.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/available-captures-for-rook/

import Foundation
import XCTest

func numRookCaptures(_ board: [[Character]]) -> Int {
    var sum = 0
    var ri = 0
    var rj = 0
    let count = board.count
    for i in 0..<count {
        let boardi = board[i]
        for j in 0..<boardi.count {
            if boardi[j] == "R" {
                // R  在这
                ri = i
                rj = j
                
                break
            }
        }
    }
    
    let riA = board[ri]
    
    for i in (1-rj)...0 {
        let item = riA[-i]
        if item == "p" {
            sum += 1
            break
        }else if item == "B" {
            break
        }
    }
    for i in rj+1..<count {
        let item = riA[i]

        if item == "p" {
            sum += 1
            break
        }else if item == "B" {
            break
        }
    }
    
    
    for i in 1-ri...0 {
        let item = board[-i][rj]
        if item == "p" {
            sum += 1
            break
        }else if item == "B" {
            break
        }
    }
    
    for i in ri+1..<count {
        let item = board[i][rj]
        if item == "p" {
            sum += 1
            break
        }else if item == "B" {
            break
        }
    }
//    print(ri, rj, sum)
    return sum
}


extension XCTestCase {
    func testNumRookCaptures() {
        let a1: [[Character]] = [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","R",".",".",".","p"],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]

        let a2: [[Character]] = [[".",".",".",".",".",".",".","."],[".","p","p","p","p","p",".","."],[".","p","p","B","p","p",".","."],[".","p","B","R","B","p",".","."],[".","p","p","B","p","p",".","."],[".","p","p","p","p","p",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]

        let a3: [[Character]] = [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","p",".",".",".","."],["p","p",".","R",".","p","B","."],[".",".",".",".",".",".",".","."],[".",".",".","B",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."]]
        
        assert(numRookCaptures(a1) == 3)
        assert(numRookCaptures(a2) == 0)
        assert(numRookCaptures(a3) == 3)
    }
}
