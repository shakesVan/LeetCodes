//
//  _面试题 16.16. 部分排序.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/12.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class Solution {
    func subSort1(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return [-1, -1] }
        let count_1 = array.count - 1
        // 寻找最后一个逆序对
        var maxV = array[0]
        var last = -1
        for i in 1...count_1 {
            if array[i] > maxV {
                maxV = array[i]
            }else if array[i] < maxV {
                last = i
            }
        }
        // 无逆序对
        if last == 0 { return [-1, -1]}
        
        var minV = array[count_1]
        var first = -1
        for i in (0...count_1).reversed() {
            if array[i] < minV {
                minV = array[i]
            }else if array[i] > minV {
                first = i
            }
        }
        
        return [first, last]
    }
    
    func subSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return [-1, -1] }
        let count_1 = array.count - 1
        // 寻找最后一个逆序对
        var maxV = array[0]
        var last = -1
        
        var minV = array[count_1]
        var first = -1
        
        for i in 0...count_1 {
            if array[i] < maxV {
                last = i
            }else {
                maxV = array[i]
            }
            
            let j = count_1 - i
            if array[j] > minV {
                first = j
            }else {
                minV = array[j]
            }
        }
        
        return [first, last]
    }
}

import XCTest

extension XCTestCase {
    func testSubSort() {
        let s = Solution()
        assert(s.subSort([1,2,4,7,10,11,7,12,6,7,16,18,19]) == [3,9])
        assert(s.subSort([1,3,5,7,9]) == [-1,-1])
        
    }
}
