//
//  _2749_得到整数零需要执行的次数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/30.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/minimum-operations-to-make-the-integer-zero/description/?envType=problem-list-v2&envId=brainteaser

import Foundation


func makeTheIntegerZero(_ num1: Int, _ num2: Int) -> Int {
    var k = 1
    while k <= num1 - num2 * k {
        if k >= (num1 - num2 * k).nonzeroBitCount {
            return k
        }
        k += 1
    }
    return -1
}

func makeTheIntegerZero1(_ num1: Int, _ num2: Int) -> Int {
    if num1 == 0 {
        return 0
    }
    let powMaxV = 2 << 60
    // 最大减数
    let maxSubtract = powMaxV + num2
    let minSubtract = 1 + num2
    
    if maxSubtract < 0 {
        // 正数减负数无法为0
        if num1 > 0 {
            return -1
        }
        
        // num1 < 0, maxSubtract < 0 时，i只能取60, 求余不为0则获取不到
        if num1 % maxSubtract != 0 {
            return -1
        }
        
        return num1 / maxSubtract
        
        
    } else if minSubtract > 0 {
        
        // 负数减正数无法为0
        if num1 < 0 {
            return -1
        }
        
        
    } else {
            
        
        // num1 > 0, maxSubtract > 0 时, 有两种情况，
        // 1、 num2 > 2^60 那么，i 只能取0
        // 2、 -2^60 < num2 < 2^60,
        
    }
    
    
    let target = num1 - num2
    
    if target < 0 {
        // 因为无法让负数减整数得到0，所以无法找到
        return -1
    }
    // TODO： 未解决
    return -1
}
