//
//  _2177_找出和为给定数字的三个连续整数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/24.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/find-three-consecutive-integers-that-sum-to-a-given-number/description/

import Foundation

func sumOfThree(_ num: Int) -> [Int] {
    
    if num % 3 > 0 {
        return []
    }
    let value = num / 3
    return [value - 1, value, value + 1]
}
