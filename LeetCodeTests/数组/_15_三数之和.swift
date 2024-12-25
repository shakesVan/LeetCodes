//
//  _15_三数之和.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/26.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/3sum/

import Foundation


/// 三指针解法
///
func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3  else { return []}
    let arr = nums.sorted()
    let leftPinCount = arr.count - 2
    var centerPin = 1
    
    var result = Set<[Int]>()
    for i in 0..<leftPinCount {
        var rightPin = arr.count - 1
        if arr[i] > 0 || arr[rightPin] < 0 {
            return Array(result)
        }
        
        let target = 0 - arr[i]
        centerPin = i + 1
        while centerPin < rightPin {
            
            let tmp = arr[centerPin] + arr[rightPin] - target
            if tmp == 0 {
                result.insert([arr[i], arr[centerPin], arr[rightPin]])
                centerPin += 1
                rightPin -= 1
                continue
            }
            if tmp > 0 {
                rightPin -= 1
            } else {
                centerPin += 1
            }
            
        }
    }
    return Array(result)
}


func threeSum2(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3  else { return []}
    let arr = nums.sorted()
    let maxL = arr.count - 3
    var set = Set<[Int]>()

    for l in 0...maxL {
        let target = -arr[l]

        var tmpSet = Set<Int>()
        for m in (l+1)..<arr.count {
            let v = target - arr[m]
            if tmpSet.contains(v){
                set.insert([-target, arr[m], v])
            }else {
                tmpSet.insert(arr[m])
            }
        }
        
    }
    return Array(set)
}


func threeSum1(_ nums: [Int]) -> [[Int]] {
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
class ThreeSumTestCase: XCTestCase {
    
    func testThreeSum() {
        assert(threeSum([-1, 0, 1, 2, -1, -4]).count == 2)
        assert(threeSum(
        [-1,0,1,-2,-1,-4]).count == 1)

        assert(threeSum([0,0,0]).count == 1)
        
        
        assert(threeSum([1,2,-2,-1]).count == 0)
        
    }
    
    
    
}

