//
//  面试题56 - I. 数组中数字出现的次数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/28.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation


private
func singleNumbers(_ nums: [Int]) -> [Int] {
    let result = nums.reduce(0) { $0 ^ $1 }
    var dev = 1
    
    while (dev & result) == 0 {  dev <<= 1 }
    var a = 0
    var b = 0
    for num in nums {
        if num & dev == 0 {
            a ^= num
        }else {
            b ^= num
        }
    }
    
    return [a, b]
}

import XCTest

extension XCTestCase {
    func testSingleNumbers() {
//        assert(singleNumbers([1,2]).sorted() == [1,2])
//        assert(singleNumbers([4,1,4,6]).sorted() == [1,6])
//        assert(singleNumbers([1,2,10,4,1,4,3,3]).sorted() == [2,10])
        assert(singleNumbers([1,5]).sorted() == [1,5])
//        assert(singleNumbers([1,2,5,2]).sorted() == [1,5])
        
    }
}
