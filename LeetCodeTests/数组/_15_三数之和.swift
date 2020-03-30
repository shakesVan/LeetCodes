//
//  _15_三数之和.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/26.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/3sum/

import Foundation



func threeSum(_ nums: [Int]) -> [[Int]] {
    let count = nums.count
    guard count > 2 else { return [] }
    
    var result: Array<[Int]> = []
    let sort = nums.sorted()
    var j = 0, k = 0, cmp = 0
    
    // 第一遍遍历是必须的，不需要全部遍历完成 ，复杂度 O n^ 2
    for i in 0..<count-2 {
        // 如果当前数字大于0，则三数之和一定大于0，所以结束循环
        if sort[i] > 0 { break }
        
        // 重复直接下一个
        if i > 0 && sort[i] == sort[i-1] {
            continue
        }
        j = i + 1
        k = count - 1
        // j 从小到大， k从大到小, 双指针
        while j < k {
            cmp = sort[i] + sort[j] + sort[k]
            if cmp == 0 {
                result.append([sort[i], sort[j],sort[k]])
                // 重复直接下一个
                while j < k && sort[j] == sort[j+1] {
                    j += 1
                }
                // 重复直接下一个
                while j < k && sort[k] == sort[k-1] {
                    k -= 1
                }
                j += 1
                k -= 1
                
            }else {
                cmp > 0 ? (k -= 1) : (j += 1)
            }
        }
    }
    
//    print(result)
    return result
}

import XCTest
extension XCTestCase {
    
    func testThreeSum() {
        assert(threeSum([-1, 0, 1, 2, -1, -4]).count == 2)
        assert(threeSum(
        [-1,0,1,-2,-1,-4]).count == 1)
        
        assert(threeSum([0,0,0]).count == 1)
        print(threeSum(maxAr).count)
//        assert(threeSum(maxAr).count == 16258)
    }
    
}

