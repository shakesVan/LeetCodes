//
//  _42_接雨水.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/4.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func trap(_ height: [Int]) -> Int {
    var sort = Array(Set(height))
    sort.sort { $0 < $1 }
    guard height.count > 2 else {
        return 0
    }
    
    var start = 0
    var end = height.count - 1
    // 用以记录是否遇到第一个大于index的数
    var flag = false
    var lastNum = 0
    
    var num = 0
    var sum = 0
    var index = 0
    
    // 只有两个元素
    while start < end - 1 && index < sort.count {
        num = 0
        for i in start...end {
            // 遇到大于index的值 重置, 否者末尾+1
            lastNum = height[i] > sort[index] ? 0 : (lastNum + 1)
            if !flag && height[i] > sort[index] {
                // 第一个大于index的值
                // 开始计次
                flag = true
                // 记录下一次开始
                start = i
            }else if flag && height[i] <= sort[index] {
                num += 1
                
            }
        }
        num -= lastNum
        end -= lastNum
        
        index += 1
        flag = false
        lastNum = 0
        if num > 0 {
            if index > 0 {
                num *= sort[index] - sort[index - 1]
            }else {
                num *= sort[index]
            }
            sum += num
        }else {
            continue
        }
        
//        print("index ==== \(index - 1)")
//        print("sort ==== \(sort[index - 1])")
//        print("num ==== \(num)")
//        print("start ==== \(start)")
//        print("end ==== \(end)")
//        print("sum ==== \(sum)")
    }

//    print("end sum ==== \(sum)")
    
    return sum
}

import XCTest

extension XCTestCase {
    func testTrap() {
        assert(trap([0,1,0,2,1,0,1,3,2,1,2,1]) == 6)
        assert(trap([0,1,0,2,1,0,1,3,2,1,3,1]) == 8)
        assert(trap([0,0,0,0,0,0,0,0,0,0,0,0]) == 0)
        assert(trap([0,0,0,0,0,1,0,0,0,0,0,0]) == 0)
        assert(trap([2,10]) == 0)
        assert(trap([2]) == 0)
        assert(trap([2, 10, 5]) == 0)
        assert(trap([10, 0, 5]) == 5)
        assert(trap([10, 1, 5]) == 4)
        assert(trap([4,2,3]) == 1)
        
    }
}
