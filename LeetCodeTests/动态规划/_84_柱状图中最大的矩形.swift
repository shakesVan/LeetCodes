//
//  _84_柱状图中最大的矩形.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/14.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


func largestRectangleArea(_ heights: [Int]) -> Int {
    if heights.count == 0 {
        return 0
    }
    
    if heights.count == 1 {
        return heights[0]
    }
    var dp: [Int?] = [Int?].init(repeating: 0, count: heights[0])
    var result = 0
    
    for i in 0..<heights.count {
        let height = heights[i]
        var tmp = [Int?].init(repeating: nil, count: height)
        
        for j in 0..<height {
            if j < dp.count, dp[j] != nil {
                tmp[j] = dp[j]
            } else {
                tmp[j] = i
            }
            let tmpResult = (j + 1) * (i - (tmp[j] ?? 0) + 1)
            result = max(result, tmpResult)
        }
        dp = tmp
    }
    return result
}


// 超时
func largestRectangleArea2(_ heights: [Int]) -> Int {
    if heights.count == 0 {
        return 0
    }
    
    if heights.count == 1 {
        return heights[0]
    }
    var dp: [Int?] = [Int?].init(repeating: 0, count: heights[0])
    var result = 0
    
    for i in 0..<heights.count {
        let height = heights[i]
        var tmp = [Int?].init(repeating: nil, count: height)
        
        for j in 0..<height {
            if j < dp.count, dp[j] != nil {
                tmp[j] = dp[j]
            } else {
                tmp[j] = i
            }
            let tmpResult = (j + 1) * (i - (tmp[j] ?? 0) + 1)
            result = max(result, tmpResult)
        }
        dp = tmp
    }
    return result
}

// 超时
func largestRectangleArea1(_ heights: [Int]) -> Int {
    if heights.count == 0 {
        return 0
    }
    
    if heights.count == 1 {
        return heights[0]
    }
//    var maxValue = 0
    
    var dp: [Int?] = [Int?].init(repeating: 0, count: heights[0])
//    var dpList: [[Int?]] = []
    var result = 0
    
    for i in 0..<heights.count {
        let height = heights[i]
//        maxValue = max(maxValue, height)
        var tmp = [Int?].init(repeating: nil, count: height)
        
        for j in 0..<height {
            if j < dp.count, dp[j] != nil {
                tmp[j] = dp[j]
            } else {
                tmp[j] = i
            }
            let tmpResult = (j + 1) * (i - (tmp[j] ?? 0) + 1)
            result = max(result, tmpResult)
//            print("min j = \(j) tmp = \(tmp), tmpResult = \(tmpResult)")
        }
        
//        for j in height..<maxValue {
//            tmp[j] = nil
//        }
        dp = tmp
//        dpList.append(tmp)
//        print("i = \(i) dp = \(dp)")
    }
//    print("dpList = \(dpList)")
    return result
}
