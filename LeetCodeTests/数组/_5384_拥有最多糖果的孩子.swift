//
//  _5384_拥有最多糖果的孩子.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/2.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    var maxV = 0
    for candy in candies {
        if candy > maxV {
            maxV = candy
        }
    }
    
    let minC = maxV - extraCandies
    var result = Array(repeating: false, count: candies.count)
    for i in 0..<candies.count {
        if candies[i] >= minC {
            result[i] = true
        }
    }
    
    return result
}

import XCTest

extension XCTestCase {
    func testKidsWithCandies() {
        assert(kidsWithCandies([2,3,5,1,3],3) == [true,true,true,false,true] )
        assert(kidsWithCandies([4,2,1,1,2],1) == [true,false,false,false,false] )
        assert(kidsWithCandies([12,1,12],10) == [true,false,true])
    }
}
