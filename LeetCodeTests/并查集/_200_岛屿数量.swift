//
//  _200_岛屿数量.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/20.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    guard grid[0].count > 0 else { return 0 }
    
    var p = Dictionary<[Int],[Int]>()
    let count_1 = grid.count - 1
    let xcount_1 = grid[0].count - 1
    
    for x in 0...count_1 {
        for y in 0...xcount_1 {
            if grid[x][y] == "1" {
                // 如果是"1" 加入集合
                if p[[x,y]] == nil {
                    p[[x,y]] = [x,y]
                }
                //判断右、下是否有"1"
                if x < count_1 && grid[x+1][y] == "1" {
                    p[[x+1, y]] = p[[x,y]]
                }
                if y < xcount_1 && grid[x][y+1] == "1" {
                    p[[x, y+1]] = p[[x,y]]
                }
            }
        }
    }
    
    print("set === \(p.values)")
    return Set(p.values).count
}

//392
private
func numIslands5(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    guard grid[0].count > 0 else { return 0 }

    let guf = GeneralUniFind<[Int]>()
    let count_1 = grid.count - 1
    let xcount_1 = grid[0].count - 1
    
    for x in 0...count_1 {
        for y in 0...xcount_1 {
            if grid[x][y] == "1" {
                // 如果是"1" 加入集合
                guf.makeSet([x,y])
                //判断右、下是否有"1"
                if x < count_1 && grid[x+1][y] == "1" {
                    guf.makeSet([x+1,y])
                    guf.union([x,y], [x+1, y])
                }
                if y < xcount_1 && grid[x][y+1] == "1" {
                    guf.makeSet([x,y+1])
                    guf.union([x,y], [x, y+1])
                }
            }
        }
    }
    
    return guf.sized()
}

// 372
private func numIslands4(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    guard grid[0].count > 0 else { return 0 }

    let guf = GeneralUniFind<[Int]>()
    let count_1 = grid.count - 1
    let xcount_1 = grid[0].count - 1
    
    for x in 0...count_1 {
        for y in 0...xcount_1 {
            if grid[x][y] == "1" {
                // 如果是"1" 加入集合
                guf.makeSet([x,y])
            }
        }
    }
    
    for x in 0...count_1 {
        for y in 0...xcount_1 {
            if grid[x][y] == "1" {
                //判断右、下是否有"1"
                if x < count_1 && grid[x+1][y] == "1" {
                    guf.union([x,y], [x+1, y])
                }
                
                if y < xcount_1 && grid[x][y+1] == "1" {
                    guf.union([x,y], [x, y+1])
                }
            }
        }
    }
    
    return guf.sized()
}

// 400
private func numIslands3(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    guard grid[0].count > 0 else { return 0 }

    let guf = GeneralUniFind<[Int]>()
    let count_1 = grid.count - 1
    let xcount_1 = grid[0].count - 1
    
    for x in 0...count_1 {
        for y in 0...xcount_1 {
            if grid[x][y] == "1" {
                // 如果是"1" 加入集合
                guf.makeSet([x,y])
            }
        }
    }
    
    for x in 0...count_1 {
        for y in 0...xcount_1 {
            if grid[x][y] == "1" {
                //判断右、下是否有"1"
                if x < count_1 && grid[x+1][y] == "1" {
                    guf.union([x,y], [x+1, y])
                }
                
                if y < xcount_1 && grid[x][y+1] == "1" {
                    guf.union([x,y], [x, y+1])
                }
            }
        }
    }
    
    //判断最后一个是否需要联合
    
    if grid[count_1][xcount_1] == "1" {
        if count_1 > 0 && grid[count_1 - 1][xcount_1] == "1" {
            guf.union([count_1, xcount_1], [count_1 - 1, xcount_1])
        }
        
        if xcount_1 > 0 && grid[count_1][xcount_1 - 1] == "1" {
            guf.union([count_1, xcount_1], [count_1, xcount_1 - 1])
        }
    }
    
    
    var set = Set<[Int]>()
    for x in 0...count_1 {
        let xcount_1 = grid[x].count
        for y in 0...xcount_1 {
            if let v = guf.find([x,y]) {
                set.insert(v)
            }
        }
    }
//    print("set === \(set)")
    return set.count
}

// 412
private func numIslands2(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    guard grid[0].count > 0 else { return 0 }

    let guf = GeneralUniFind<Point>()
    let count_1 = grid.count - 1
    let xcount_1 = grid[0].count - 1
    
    for x in 0...count_1 {
        for y in 0...xcount_1 {
            if grid[x][y] == "1" {
                // 如果是"1" 加入集合
                guf.makeSet(Point(x, y))
            }
        }
    }
    for x in 0..<count_1 {
        for y in 0..<xcount_1 {
            if grid[x][y] == "1" {
                //判断右、下是否有"1"
                if grid[x+1][y] == "1" {
                    guf.union(Point(x, y), Point(x+1, y))
                }
                
                if grid[x][y+1] == "1" {
                    guf.union(Point(x, y), Point(x, y+1))
                }
            }
        }
    }
    
    //判断最后一个是否需要联合
    if grid[count_1][xcount_1] == "1" {
        if grid[count_1 - 1][xcount_1] == "1" {
            guf.union(Point(count_1, xcount_1), Point(count_1 - 1, xcount_1))
        }else if grid[count_1][xcount_1 - 1] == "1" {
            guf.union(Point(count_1, xcount_1), Point(count_1, xcount_1 - 1))
        }
    }
    
    var set = Set<Point>()
    for x in 0...count_1 {
        let xcount_1 = grid[x].count
        for y in 0...xcount_1 {
            if let v = guf.find(Point(x,y)) {
                set.insert(v)
            }
        }
    }
    print("set === \(set)")
    return set.count
}

//  超时
private func numIslands1(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    guard grid[0].count > 0 else { return 0 }

    let guf = GeneralUniFind<Point>()
    let count_1 = grid.count - 1
    for x in 0...count_1 {
        let xcount_1 = grid[x].count - 1
        for y in 0...xcount_1 {
            if grid[x][y] == "1" {
                let pxy = Point(x, y)
                // 如果是"1" 加入集合
                guf.makeSet(pxy)
                //判断右、下是否有"1"
                if x < count_1 && grid[x+1][y] == "1" {
                    let px1y = Point(x+1, y)
                    guf.makeSet(px1y)
                    guf.union(pxy, px1y)
                }
                
                if y < xcount_1 && grid[x][y+1] == "1" {
                    let pxy1 = Point(x, y+1)
                    guf.makeSet(pxy1)
                    guf.union(pxy, pxy1)
                }
                
            }
        }
    }
    var set = Set<Point>()
    for x in 0...count_1 {
        let xcount_1 = grid[x].count
        for y in 0...xcount_1 {
            if let v = guf.find(Point(x,y)) {
                set.insert(v)
            }
        }
    }
    
    return set.count
}

private struct Point: Hashable {
    var x: Int = 0
    var y: Int = 0
    init(_ x: Int,_ y: Int) {
        self.x = x
        self.y = y
    }
}


import XCTest

extension XCTestCase {
    func testNumIslands() {
        let lands1: [[Character]] =
            [["1","1","1","1","0"],
             ["1","1","0","1","0"],
             ["1","1","0","0","0"],
             ["0","0","0","0","0"]]
        
        let lands2: [[Character]] =
            [["1","1","0","0","0"],
             ["1","1","0","0","0"],
             ["0","0","1","0","0"],
             ["0","0","0","1","1"]]
        
        let lands3: [[Character]] = [["1"]]
        let lands4: [[Character]] = [["0"]]
        let lands5: [[Character]] = [["1","1"]]
        
        let lands6: [[Character]] = [["1"],["1"]]
        
        let lands7: [[Character]] = [["1","0","1"]]
        let lands8: [[Character]] = [["1"],["0"],["1"]]
        let lands9: [[Character]] = [["1","0","1","1","0","1","1"]]
        let lands10: [[Character]] =  [["1","1","1"],["0","1","0"],["1","1","1"]]
        
//        assert(numIslands(lands1) == 1)
//        assert(numIslands(lands2) == 3)
//        assert(numIslands(lands3) == 1)
//        assert(numIslands(lands4) == 0)
//        assert(numIslands(lands5) == 1)
//        assert(numIslands(lands6) == 1)
//        assert(numIslands(lands7) == 2)
//        assert(numIslands(lands8) == 2)
//        assert(numIslands(lands9) == 3)
        assert(numIslands(lands10) == 1)
        
    }
    
    func testUFPoint() {
        let guf = GeneralUniFind<Point>()
        let p1 = Point(1, 1)
        let p2 = Point(2, 2)
        let p3 = Point(3, 3)
        let p4 = Point(4, 4)
        guf.makeSet(p1)
        guf.makeSet(p2)
        guf.makeSet(p3)
        guf.makeSet(p4)
        
        guf.union(p1, p2)
        guf.union(p3, p4)
        
        assert(guf.find(p1) == p2)
        assert(guf.find(p2) == p2)
        
        assert(guf.isSame(p1, p2) == true)
        assert(guf.isSame(p3, p4) == true)
        
        assert(guf.isSame(p2, p3) == false)
        guf.union(p2, p3)
        
        assert(guf.isSame(p1, p4) == true)
        
    }
}
