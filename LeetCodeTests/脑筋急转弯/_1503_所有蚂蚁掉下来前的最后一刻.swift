//
//  _1503_所有蚂蚁掉下来前的最后一刻.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/29.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/last-moment-before-all-ants-fall-out-of-a-plank/description/?envType=problem-list-v2&envId=brainteaser

import Foundation

func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
    if n == 0 {
        return 0
    }
    if left.count == 0 && right.count == 0 {
        return 0
    }
    let minV = right.min() ?? n
    let maxV = left.max() ?? 0
    
    return max(n - minV, maxV) + 1
}
