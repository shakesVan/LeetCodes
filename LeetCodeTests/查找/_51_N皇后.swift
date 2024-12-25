//
//  _51_N皇后.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/12/3.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func solveNQueens(_ n: Int) -> [[String]] {
    if n <= 0 {
        return []
    }
    if n == 1 {
        return [["Q"]]
    }
    
    var results: [[String]] = []
    var result: [[ChessType]] = []
    
    // key为坐标[i, j]
    
    // 首个Q，遍历整行
    for j0 in 0..<n {
        // 竖
        var vlist = [Bool].init(repeating: false, count: n)
        // 左斜： 同列计算公式，getS1Index(i, j, n)
        var s1list = [Bool].init(repeating: false, count: 2 * n)
        // 右斜： 同列计算公式，getS1Index(i, j, n)
        var s2list = [Bool].init(repeating: false, count: 2 * n)
        vlist[j0] = true
        
        s1list[getS1Index(0, j0, n)] = true
        s2list[getS2Index(0, j0, n)] = true
        
        result = [getChessTypes(with: j0, in: n)]
        // 该行是否能放置Q
        var flag = false
        for i in 1..<n {
            for j in 0..<n {
                // 竖上有，跳过该竖, 斜上有，跳过该竖
                if vlist[j] || s1list[getS1Index(i, j, n)] || s2list[getS2Index(i, j, n)] {
                    continue
                }
                vlist[j] = true
                s1list[getS1Index(i, j, n)] = true
                s2list[getS2Index(i, j, n)] = true
                result.append(getChessTypes(with: j, in: n))
                flag = true
                break
                
            }
            // 无法放置，则退出中循环
            if !flag {
                break
            }
        }
        if result.count == n {
            // 成功
            let tmp = result.map {
                String($0.map { $0.getCharacter })
            }
            results.append(tmp)
        }
        
    }
    
    
    return results
}

func getS1Index(_ i: Int, _ j: Int, _ n: Int) -> Int {
    n + j - i
}

func getS2Index(_ i: Int, _ j: Int, _ n: Int) -> Int {
    i + j
}

func getChessTypes(with index: Int, in n: Int) -> [ChessType] {
    guard index >= 0, index < n else {
        return []
    }
    var result = [ChessType].init(repeating: ChessType.empty, count: n)
    result[index] = .queen
    return result
}

enum ChessType: String {
    case empty = "."
    case queen = "Q"
    
    var getCharacter: Character {
        Character(self.rawValue)
    }
}

import XCTest

class SolveNQueensCase: XCTestCase {
    func testSolveNQueens() {
        assertWithLogIfFalse(solveNQueens(5), [["Q....","..Q..","....Q",".Q...","...Q."],["Q....","...Q.",".Q...","....Q","..Q.."],[".Q...","...Q.","Q....","..Q..","....Q"],[".Q...","....Q","..Q..","Q....","...Q."],["..Q..","Q....","...Q.",".Q...","....Q"],["..Q..","....Q",".Q...","...Q.","Q...."],["...Q.","Q....","..Q..","....Q",".Q..."],["...Q.",".Q...","....Q","..Q..","Q...."],["....Q",".Q...","...Q.","Q....","..Q.."],["....Q","..Q..","Q....","...Q.",".Q..."]])
        
        assertWithLogIfFalse(solveNQueens(4), [[".Q..","...Q","Q...","..Q."],
                                   ["..Q.","Q...","...Q",".Q.."]])
        assertWithLogIfFalse(solveNQueens(1), [["Q"]])
        
    }
}

func assertWithLogIfFalse<T: Equatable>(_ target1: T, _ target2: T) {
    let result = target1 == target2
    if !result {
        print("********B\n\(target1) \n================\n \(target2)\nE********")
    }
    assert(result)
    
}
