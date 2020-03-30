//
//  _1389._按既定顺序创建目标数组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/24.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/create-target-array-in-the-given-order/

import Foundation
import XCTest

func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
    var target = [Int]()
    
    for i in 0..<index.count {
        target.insert(nums[i], at: index[i])
    }
    
    return target
}

extension XCTestCase {
    func testTarget() {
        let nums1 = [0,1,2,3,4]
        let index1 = [0,1,2,2,1]
        
        assert(createTargetArray(nums1, index1) == [0,4,1,3,2])
        
        let nums2 = [1,2,3,4,0]
        let index2 = [0,1,2,3,0]
        assert(createTargetArray(nums2, index2) == [0,1,2,3,4])
    }
}
