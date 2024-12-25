//
//  _5385_改变一个整数能得到的最大差值.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/2.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
func maxDiff(_ num: Int) -> Int {
    /**
     n位数，首先判断首位是几，如果是2-8，那么最大的就是 n个8,实际值取决于于首位相同的元素
     如果是9，那么最大的是
     如果第二位也是9，则向下找，找出第一个不是9的数字并使其所有与之相等的都改为9
     最小的是吧所有的9改为1
     如果是1，那么最大的数是第一位改为9，然后所有与第一位相同的都改为9，
     最小 如果第二位是0或者1，判断下一位，直到不是0或者1为止，取得该位数，t把它及其相同的都改为0
     
     */
    guard num > 0 else { return 0 }
    var arr = [Int]()
    var vnum = num
    repeat {
        arr.append(vnum % 10)
        vnum /= 10
    }  while vnum > 0
    arr = arr.reversed()
    var maxV: Int
    var minV: Int
    if arr[0] == 9 {
        maxV = num
        // 求哪一位改为0
        for i in 1..<arr.count {
            if arr[i] != 9 {
                maxV = change(arr, i, 9)
                break
            }
        }
        
        minV = change(arr, 0, 1)
    }else if arr[0] == 1{
        maxV = change(arr, 0, 9)
        minV = num
        // 求哪一位改为0
        for i in 1..<arr.count {
            if arr[i] != 0 && arr[i] != 1 {
                minV = change(arr, i, 0)
                break
            }
        }
    }else {
        maxV = change(arr, 0, 9)
        minV = change(arr, 0, 1)
    }
    
    return maxV - minV
}


/// 把nums的中与第digit位相等的元素全部改为value
/// 返回改完之后的数字
func change(_ nums: [Int], _ digit: Int, _ value: Int) -> Int {
    
    if digit >= nums.count {
        return nums.reduce(into: 0) { $0 = $0 * 10 + $1 }
    }
    var vnums = nums
    let num = nums[digit]
    for i in 0..<nums.count {
        if num == nums[i] {
            vnums[i] = value
        }
    }
    
    
    return vnums.reduce(into: 0) { $0 = $0 * 10 + $1 }
}

import XCTest

extension XCTestCase {
    func testMaxDiff() {
        assert(maxDiff(555) == 888)
        assert(maxDiff(9) == 8)
        
        assert(maxDiff(123456) == 820000)
        assert(maxDiff(10000) == 80000)
        assert(maxDiff(9288) == 8700)
        assert(maxDiff(1101057) == 8808050)
        assert(maxDiff(99202851) == 88707000)
    }
    
    func testChange() {
        assert(change([5, 5, 5], 0, 9) == 999)
        assert(change([5, 5, 5], 0, 1) == 111)
        
        
        assert(change([9], 0, 9) == 9)
        assert(change([9], 0, 1) == 1)
        
        
        assert(change([1,2,3,4,5,6], 0, 9) == 923456)
        assert(change([1,2,3,4,5,6], 1, 0) == 103456)
        
        assert(change([1,0,0,0,0], 0, 9) == 90000)
        assert(change([1,0,0,0,0], 0, 1) == 10000)
        
        assert(change([9,2,8,8], 1, 9) == 9988)
        assert(change([9,2,8,8], 0, 1) == 1288)
        
        
    }
}
