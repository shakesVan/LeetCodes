//
//  _18_四数之和.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/26.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/4sum/

import Foundation


fileprivate
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let count = nums.count
    guard count > 3 else { return [] }
    var result: [[Int]] = []
    let sort = nums.sorted()
    var m = 0,j = 0,k = 0,cmp = 0
    
    // 第一遍遍历是必须的，不需要全部遍历完成
    for i in 0..<count-3 {
        if i != 0 && sort[i] == sort[i-1] {
            continue
        }
        if sort[i] + sort[i+1] + sort[i+2] + sort[i+3] > target { break }
        
        k = count-1
        if sort[k-3] + sort[k-2] + sort[k-1] + sort[k] < target { break }
        m = i + 1
        j = m + 1
        // j 从小到大， k从大到小，复杂度 O n^ 2
        while m < k - 1  { // 如果m = k - 1, 则j = k 退出循环

            cmp = sort[i] + sort[m] + sort[j] + sort[k] - target
            //                print("i m j k: \(i), \(m), \(j), \(k)")
            if cmp == 0 {
                let ele = [sort[i],sort[m], sort[j],sort[k]]
                
                result.append(ele)
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
                // 大于0，大值k左移
                // 小于0，小值j右移
                cmp > 0 ?  (k -= 1) : (j += 1)
                
            }
            // 如果j >= k, m + 1，重置j k
            if j >= k {
                // 重复直接下一个
                while m < k && sort[m] == sort[m+1] {
                    m += 1
                }
                m += 1
                j = m + 1
                k = count - 1
            }
            
        }
    }
//    print(result)
    return result
}

import XCTest
extension XCTestCase {
    
    func testFourSum() {
        assert(fourSum([1, 0, -1, 0, -2, 2], 0).count == 3)

        assert(fourSum([1,0,-1,3,-2,2], 2).count == 3)
        assert(fourSum([1,-2,-5,-4,-3,3,3,5], -11).count == 1)
        assert(fourSum([-1,-5,-5,-3,2,5,0,4], -7).count == 2)
        
    }
}

