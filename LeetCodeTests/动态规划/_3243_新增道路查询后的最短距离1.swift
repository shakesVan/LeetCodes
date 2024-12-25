//
//  _3243_新增道路查询后的最短距离1.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/19.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func shortestDistanceAfterQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
    var dp: [Int: Int] = [:]
    var map: [Int: [Int]] = [:]
    for i in 0..<n {
        dp[i] = i
    }
    
    var result: [Int] = []
    for j in 0..<queries.count {
        let querie = queries[j]
        guard querie.count == 2 else {
            continue
        }
        
        if map[querie[1]] == nil {
            map[querie[1]] = []
        }
        map[querie[1]]?.append(querie[0])
        
        for i in querie[1]..<n {
            var tmp = dp[i] ?? i
            var arr = map[i] ?? []
            arr.append(i - 1)
            arr.forEach { k in
                tmp = min(tmp, (dp[k] ?? k) + 1)
            }
        
            dp[i] = tmp
            
            print("i = \(i), querie = \(querie), arr = \(arr)")
        }
        
        print("querie = \(querie), dp = \(dp)")
        result.append(dp[n-1] ?? n-1)
    }
    
    print("result: dp = \(dp)")
    return result
}
