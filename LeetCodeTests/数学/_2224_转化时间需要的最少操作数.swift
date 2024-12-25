//
//  _2224_转化时间需要的最少操作数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/25.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/minimum-number-of-operations-to-convert-time/description/

import Foundation

func convertTime(_ current: String, _ correct: String) -> Int {
    let currentTimes = current.components(separatedBy: ":")
        .map { Int($0) ?? 0 }
    let correctTimes = correct.components(separatedBy: ":")
        .map { Int($0) ?? 0 }
    
    guard currentTimes.count == correctTimes.count,
          correctTimes.count == 2,
          currentTimes[0] <= correctTimes[0] else {
        // 数据异常
        print("数据异常 current =\(current), correct=\(correct)")
        return -1
    }
    
    
    var minTimes = [Int].init(repeating: 0, count: currentTimes.count)
    var flag = 0
    for i in 0..<currentTimes.count {
        let index = currentTimes.count - i - 1
        let currentTime = currentTimes[index]
        let correctTime = correctTimes[index]
        
        var minTime = correctTime - currentTime - flag
        
        if minTime < 0 {
            minTime += 60
            flag = 1
        } else {
            flag = 0
        }
        minTimes[index] = minTime
    }
    
    let result = minTimes[0] + minTimes[1] / 15 + (minTimes[1] % 15) / 5 + minTimes[1] % 5
    
    return result
}
