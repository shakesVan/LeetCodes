//
//  _1248_统计「优美子数组」.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/21.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
/***
 dp(i,k) 表示以i结尾，数量为k的优美子数组个数 i [0, count], k [1, count]
 dp(1,1) = nums[0] == 奇数 ? 1 : 0
 dp(i,0) = nums[i-1] == 奇数 ? 1 : (dp(i-1,0) + 1)
 dp(0,k) = 0,
 
 dp(i,k) 如果 k > i, dp(i,k)= 0
 否则， nums[i-1] == 奇数 ? dp(i-1,k-1) : dp(i-1,k)
 */

func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var dp = Array(repeating: 0, count: k+1)
    dp[0] = 1
    var result = 0
    for i in 1...nums.count {
        for m in (1...min(i,k)).reversed() {
            dp[m] = (nums[i-1] & 1) == 1 ? dp[m-1] : dp[m]
        }
        dp[0] = (nums[i-1] & 1) == 1 ? 1 : (dp[0] + 1)
        result += dp[k]
//        print("dp === \(dp)")
    }
    return result
}

func numberOfSubarrays1(_ nums: [Int], _ k: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: k+1), count: nums.count + 1 )
    dp[0][0] = 1
    dp[1][1] = (nums[0] & 1) == 1 ? 1 : 0
    var result = 0
    for i in 1...nums.count {
        for m in 0...k {
            if m == 0 {
                dp[i][0] = (nums[i-1] & 1) == 1 ? 1 : (dp[i-1][0] + 1)
            }else {
                dp[i][m] = (nums[i-1] & 1) == 1 ? dp[i-1][m-1] : dp[i-1][m]
            }
           
        }
    }
    for i in 1...nums.count {
         result += dp[i][k]
    }
//    print("dp === \(dp)")
    
    return result
}

import XCTest

extension XCTestCase {
    func testnumberOfSubarrays() {
        assert(numberOfSubarrays([1,1,2,1,1], 3) == 2)
        
        assert(numberOfSubarrays([2,4,6], 1) == 0)
        
        assert(numberOfSubarrays([2,2,2,1,2,2,1,2,2,2], 2) == 16)
    }
}

