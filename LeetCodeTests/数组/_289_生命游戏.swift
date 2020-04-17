//
//  _289_生命游戏.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/2.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/game-of-life/

import Foundation

func gameOfLife(_ board: inout [[Int]]) {
    var arr = Array(repeating:
        Array(repeating: 0,
              count: board.first?.count ?? 0),
                    count: board.count)
    
    let count = board.count
    var i_count: Int
    for i in 0..<count {
        i_count = board[i].count
        for j in 0..<i_count {
            // 只需要对是1的进行操作
            if board[i][j] == 1 {
                for m in [-1, 0, 1] {
                    for n in [-1, 0, 1] {
                        if m == 0 && n == 0 {
                            continue
                        }
                        
                        if i + m < 0 || j + n < 0 {
                            continue
                        }
                        if i + m >= count || j + n >= i_count {
                            continue
                        }

                        // 如果是周围且不越界则加一
                        arr[i + m][j + n] += 1
                    }
                }
            }
        }
    }
    
//    for i in 0..<count {
//        i_count = board[i].count
//        for j in 0..<i_count {
//            board[i][j] = (arr[i][j] == 3 || (arr[i][j] == 2 && board[i][j] == 1)) ? 1 : 0
//        }
//    }
    for i in 0..<count {
        i_count = board[i].count
        for j in 0..<i_count {
            setStatus(&board[i][j], arr[i][j])
        }
    }
    
}

func setStatus(_ now: inout Int, _ around: Int) {
    if around == 3 {
        now = 1
        return
    }
    if around == 2 && now == 1 {
        now = 1
        return
    }
    now = 0
    return
}

import XCTest
extension XCTestCase {
    func testGameOfLife() {
        var board = [
          [0,1,0],
          [0,0,1],
          [1,1,1],
          [0,0,0]
        ]
        gameOfLife(&board)
        assert(board == [
                 [0,0,0],
                 [1,0,1],
                 [0,1,1],
                 [0,1,0]
               ])
        
    }
}
