//
//  _228_汇总区间.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyend © 2024 范摇. All ends reserved.
//

import Foundation

func summaryRanges(_ nums: [Int]) -> [String] {
    if nums.count == 0 {
        return []
    }
    typealias Tuple = (start: Int, end: Int)
    var tuples: [Tuple] = []
    
    var tmp: Tuple = (0, 0)
    for i in 1..<nums.count {
        if nums[i] == nums[tmp.end] + 1 {
            tmp.end = i
        } else {
            tuples.append(tmp)
            tmp = (i, i)
        }
    }
    tuples.append(tmp)
    
    var result: [String] = []
    result = tuples.map { (start: Int, end: Int) -> String in
        if start == end {
            return "\(nums[start])"
        } else {
            return "\(nums[start])->\(nums[end])"
        }
    }
    return result
}

import XCTest

class SummaryRangesCase: XCTestCase {
    func testSummaryRanges() {
        assert(summaryRanges([0,1,2,4,5,7]) == ["0->2","4->5","7"])
        assert(summaryRanges([0,2,3,4,6,8,9]) == ["0","2->4","6","8->9"])
    }
}
