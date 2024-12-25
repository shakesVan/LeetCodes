//
//  _2568_最小无法得到的或值.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/29.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/minimum-impossible-or/?envType=problem-list-v2&envId=brainteaser

import Foundation


func minImpossibleOR1(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 1
    }
    
    var allMap = [Int: Bool]()
    nums.forEach {
        allMap[$0] = true
    }
    
    let count = Int(sqrt(Double(nums.max() ?? 1))) + 1
    
    
    for i in 0...count {
        let value = 1 << i
        
        if !(allMap[value] ?? false) {
            return value
        }
        
    }
    return 1
}



func minImpossibleOR(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 1
    }
    
    var all = nums.reduce(0, { $0 | $1 })
    var tmp = 1
    
    let count = Int(sqrt(Double(all))) + 1
    
    for i in 0...count {
        let value = 1 << i
        if !nums.contains(where: { $0 == value }) {
            return value
        }
        
        tmp = all >> i
        if tmp & 1 == 0 {
            print("all == \(all), tmp == \(tmp), i == \(i)")
            return value
        }
    }
    print("all == \(all), tmp == \(tmp)")
    return 1
}


