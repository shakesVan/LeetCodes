//
//  1. 两数之和.swift
//  LeetCode
//
//  Created by 范摇 on 2020/3/22.
//  Copyright © 2020 范摇. All rights reserved.
//https://leetcode-cn.com/problems/two-sum/

import Foundation

public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int:Int]()
    let count = nums.count
    
    for i in 0..<count {
        let item = nums[i]
        if let difi = map[target - item],
            difi != i {
            // 小的放前面 difi > i ? [i, difi] : [difi, i]
            return [difi, i]
        }
        map[item] = i
    }
    return [0, 0]
}

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    let tuple = nums.enumerated().sorted { (t1, t2) -> Bool in
        t1.element < t2.element
    }
    var m = 0
    let count = nums.count
    var n = count - 1
    
    for _ in 0..<count {
        
        let s_m = tuple[m].element
        let s_n = tuple[n].element
        let cmp = target - s_m  - s_n
        if cmp == 0 {
            print("m == \(m), n == \(n)")
            let o_n = tuple[n].offset
            let o_m = tuple[m].offset
            if o_m > o_n {
                return [o_n, o_m]
            }
            return [o_m, o_n]
        } else if cmp > 0 {
            m += 1
        } else {
            n -= 1
        }
    }
    
    print("m == \(m), n == \(n)")
    return [tuple[m].offset, tuple[n].offset]
}


func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 2 else {
        return [0, 0]
    }
    var m = 0
    let count = nums.count
    var n = count - 1
    
    for _ in 0..<count {
        if m >= n {
            return [0, 0]
        }
        let s_m = nums[m]
        let s_n = nums[n]
        let cmp = target - s_m  - s_n
        if cmp == 0 {
            print("find m == \(m), n == \(n)")
            return [m, n]
        } else if cmp > 0 {
            m += 1
        } else {
            n -= 1
        }
    }
    print(" not found m == \(m), n == \(n)")
    return [0, 0]
}
