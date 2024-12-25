//
//  _2240_买钢笔和铅笔的方案数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func waysToBuyPensPencils(_ total: Int, _ cost1: Int, _ cost2: Int) -> Int {
    let maxCost = max(cost1, cost2)
    let minCost = min(cost1, cost2)
    
    let maxCount = total / maxCost
    
    var result = 0
    for i in 0...maxCount {
        let minTotal = total - maxCost * i
        result += minTotal / minCost + 1
    }
    return result
        
}
