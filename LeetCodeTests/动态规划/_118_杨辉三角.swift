//
//  _118_杨辉三角.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/1.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func generate(_ numRows: Int) -> [[Int]] {
    // dp(i, j) 为第i行，第j个数据
    // dp(0, 0) = 1, dp(i, 0) = 1, dp(numRows, numRows) = 1
    // dp(i, j) = dp(i - 1, j - 1) + dp(i - 1, j)
    if numRows == 0 {
        return [[]]
    }
    
    var resultList = [[Int]]()
    var result = [Int]()
    var dp = 1
    result = [dp]
    resultList.append(result)
    
    if numRows == 1 {
        return resultList
    }
    
    for i in 1..<numRows {
        dp = 1
        result = [dp]

        for j in 1..<(i) {
            dp = resultList[i-1][j-1] + resultList[i-1][j]
            result.append(dp)
//            print("dp = \(dp), i = \(i), j = \(j)")
        }

        
        dp = 1
        result.append(dp)
//        print("reslut = \(result), i = \(i)")
        resultList.append(result)
        
    }
    
    return resultList
}
