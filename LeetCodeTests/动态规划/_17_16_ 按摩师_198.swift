//
//  _17_16_ 按摩师.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/24.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/the-masseuse-lcci/
// https://leetcode-cn.com/problems/house-robber/

import Foundation
import XCTest

func massage(_ nums: [Int]) -> Int{
    var a = 0, b = 0
    
    for i in 0..<nums.count {
        let c = max(b, a + nums[i]);
        a = b;
        b = c;
    }
    
    return b;
}

func rob(_ nums: [Int]) -> Int{
    guard nums.count > 0 else {
        return 0
    }
    
    var di_1 = 0
    var di = nums[0]
    
    for i in 1..<nums.count {
        let tmp = max(di, di_1 + nums[i])
        di_1 = di
        di = tmp
    }
    
    return di;
}


//func max<E: Comparable>(a: E, b: E) -> E {
//    return a > b ? a : b
//}

extension XCTestCase {
    func testMessage() {
        assert(massage([1,2,3,1]) == 4)
        
        assert(massage([2,7,9,3,1]) == 12)
        
        assert(massage([2,1,4,5,3,1,1,3]) == 12)
        
        
    }
    
    func testRob() {
        assert(massage([1,2,3,1]) == 4)
        
        assert(massage([2,7,9,3,1]) == 12)
        
        assert(massage([2,1,4,5,3,1,1,3]) == 12)
        assert(massage([]) == 0)
        assert(massage([3]) == 3)
        
    }
}
