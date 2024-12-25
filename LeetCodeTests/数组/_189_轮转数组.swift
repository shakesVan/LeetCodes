//
//  _189_轮转数组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/7.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation



func rotate(_ nums: inout [Int], _ k: Int) {
    let count = nums.count
    
    if count <= 1 || k % count == 0 {
        return
    }
    
    let m = gcd(count, k)
    let n = count / m
    for j in 1...m {
        for i in 1...n {
            let index = (count - j + i * k) % n
            (nums[count-j], nums[index]) = (nums[index], nums[count-j])
            print("i = \(i),j = \(j), nums = \(nums)")
        }
    }
}

func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    if r != 0 {
        return gcd(b, r)
    } else {
        return b
    }
}


func rotate1(_ nums: inout [Int], _ k: Int) {
    if nums.count <= 1 {
        return
    }
    let n = nums.count
    var result: [Int] = []
//    n-k..<n  0...n-k-1
    var k = k % n
    for i in (n-k)..<n {
        result.append(nums[i])
    }
    
    for i in 0...(n-k-1) {
        result.append(nums[i])
    }
    
    for i in 0..<n {
        nums[i] = result[i]
    }
}
