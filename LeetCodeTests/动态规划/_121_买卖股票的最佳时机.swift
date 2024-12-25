//
//  _121_买卖股票的最佳时机.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/1.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/

import Foundation

private
func maxProfit(_ prices: [Int]) -> Int {
    if prices.count <= 1 {
        return 0
    }
    var min = prices[0]
    var result = 0
    for price in prices {
        if price < min {
            min = price
        } else {
            result = max(result, price - min)
        }
    }
    return result
}

private
func maxProfit15(_ prices: [Int]) -> Int {
    
    guard prices.count > 1 else { return 0 }
    var minI = prices[0]
    var maxV = 0
    var cmp: Int
    for i in 1..<prices.count {
        cmp = prices[i] - minI
        if cmp < 0 {
            minI = prices[i]
        }
        if cmp > maxV {
            maxV = cmp
        }
    }
    return maxV
}


func maxProfit14(_ prices: [Int]) -> Int {
    // dp(i) 为以i为卖出点的最大收益
    // dp(0) = 0, dp(1) = max((prices[1] - prices[0]), 0)
    // i>=1时，dp(i) = max(0, prices[i] - prices[i-1] + dp(i-1))
    // 结果为dp中的最大值
    if prices.count <= 1 {
        return 0
    }
    var dp = 0
    var result = dp
    var tmp = 0
    for i in 1..<prices.count {
        
        tmp = prices[i] - prices[i-1] + dp
        if tmp < 0 {
            dp = 0
        } else {
            dp = tmp
            result = max(result, dp)
        }
    }
    return result
}


func maxProfit13(_ prices: [Int]) -> Int {
    // dp(i) 为以i为卖出点的最大收益
    // dp(0) = 0, dp(1) = max((prices[1] - prices[0]), 0)
    // i>=1时，dp(i) = max(0, prices[i] - prices[i-1] + dp(i-1))
    // 结果为dp中的最大值
    if prices.count <= 1 {
        return 0
    }
    var dp = 0
    var result = dp
    for i in 1..<prices.count {
        dp = max(0, prices[i] - prices[i-1] + dp)
        if dp != 0 {
            result = max(result, dp)
        }
    }
    return result
}



func maxProfit11(_ prices: [Int]) -> Int {
    // dp(i) 为以i为卖出点的最大收益
    // dp(0) = 0, dp(1) = max((prices[1] - prices[0]), 0)
    // i>=1时，dp(i) = max(0, prices[i] - prices[i-1] + dp(i-1))
    // 结果为dp中的最大值
    if prices.count <= 1 {
        return 0
    }
    var dp = 0
    var result = dp
    for i in 1..<prices.count {
        
        let tmp = prices[i] - prices[i-1]
        if tmp + dp < 0 {
            dp = 0
        } else {
            dp += tmp
            result = max(result, dp)
        }
    }
    return result
}


func maxProfit2(_ prices: [Int]) -> Int {
    /**
     定义：dp(i) 在第i天卖出的最大收益 i 属于 [1,prices.count)，
     必须要先进行买，才能卖
     初始值：dp(1) = max(prices[1] - prices[0],0)  为0说明，买卖亏本,所以没有买卖
     
     状态转移：dp(i)
     如果dp(i-1)大于0，第i天的价格 - 第i-1天的价格 + 之前的赢利：
     dp(i) = max(dp(i-1) + (prices[i] - prices[i-1]),0)
     如果dp(i-1) == 0，说明prices[i-1]是之前所有价格中最小的，
     dp(i) = max(prices[i] - prices[i-1],0)
     故 dp(i) = max(dp(i-1) + (prices[i] - prices[i-1]),0)
     */
    guard prices.count > 1 else { return 0 }
    var dp = max(prices[1] - prices[0], 0)
    var maxV = dp
    for i in 2..<prices.count {
        dp = max(dp + prices[i] - prices[i-1],0)
        if dp > maxV {
            maxV = dp
        }
    }
    return maxV
}

private
func maxProfit1(_ prices: [Int]) -> Int {
    /**
     定义：dp(i) 在第i天卖出的最大收益 i 属于 [1,prices.count)，
     必须要先进行买，才能卖
     初始值：dp(1) = prices[1] - prices[0]  为负说明，买卖亏本
     
     状态转移：dp(i)
     如果dp(i-1)大于0， dp(i) = dp(i-1) + (prices[i] - prices[i-1])
     如果dp(i-1)小于0，说明prices[i-1]是之前所有价格中最小的，dp(i) = prices[i] - prices[i-1]
     */
    guard prices.count > 1 else { return 0 }
    var dp = prices[1] - prices[0]
    var maxV = max(dp, 0)
    for i in 2..<prices.count {
        if dp > 0 {
            dp = dp + prices[i] - prices[i-1]
        }else {
            dp = prices[i] - prices[i-1]
        }
        maxV = max(dp,maxV)
    }
    return maxV
}

import XCTest

fileprivate
class MaxProfitCase: XCTestCase {
    func testMaxProfit() {
        
        assert(maxProfit([7,1,5,3,6,4]) == 5)
        
        assert(maxProfit([7,6,4,3,1]) == 0)
    }
}
