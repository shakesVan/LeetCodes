//
//  _914_卡牌分组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/27.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func hasGroupsSizeX(_ deck: [Int]) -> Bool {
    guard deck.count > 1 else { return false }

    var dict = [Int: Int]()
    for item in deck {
        let count = dict[item] ?? 0
        dict[item] = count + 1
    }
    
    let times = dict.values.sorted()
    
    var minE = times[0]
    if times.count == 1 {
        return minE > 1
    }else if minE == 1 {
        return false
    }
    
    for i in 1..<times.count {
        let x = minElement(times[i], minE)

//        print(x,minE)
        if x == 1 { return false }
        
        if minE > x {
            minE = x
        }else if x % minE != 0 {
            return false
        }
    }
//    print(dict)
    return true
}

func minElement(_ a: Int, _ b: Int) -> Int {
    
    
    if a == b { return a }
    let temp = min(a, b)
    guard temp > 1 else { return 1 }
    var (a, b) = (max(a, b), temp)
    
    while b > 0 {
        (a, b) = (b, a % b)
    }
//    print("a === \(a)")
    return a
}

import XCTest

extension XCTestCase {
    func testMinElement() {
        assert(minElement(4,2) == 2)
        
        assert(minElement(12,8) == 4)
        
        assert(minElement(27,18) == 9)
        
        
    }
    func testHasGroupsSizeX() {
        assert(hasGroupsSizeX([1,2,3,4,4,3,2,1]) == true)

        assert(hasGroupsSizeX([1,1,1,2,2,2,3,3]) == false)
        assert(hasGroupsSizeX([1]) == false)
        assert(hasGroupsSizeX([1,1]) == true)
        assert(hasGroupsSizeX([0,0,0,0,0,1,1,2,3,4]) == false)
        assert(hasGroupsSizeX([1,1,2,2,2,2]) == true)
        assert(hasGroupsSizeX([0,0,0,0,1,1,2,2,3,3]) == true)
        assert(hasGroupsSizeX([1,1,1,1,1,0,0,0]) == false)
        assert(hasGroupsSizeX([1,1,1,1,1,1]) == true)
        
//        assert(hasGroupsSizeX(bigAr) == true)
        
    }
}
