//
//  _322_零钱兑换.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/6.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if coins.count == 0 {
        return -1
    }
    if amount == 0 {
        return 0
    }
    var dp: [Int?] = Array.init(repeating: nil, count: amount + 1)
    dp[0] = 0
    for i in 1...amount {
        for j in 0..<coins.count {
            let mine = i - coins[j]
            if mine < 0 {
                continue
            }
            if let minev = dp[mine] {
                dp[i] = min(dp[i] ?? Int.max, minev + 1)
            }
        }
    }
    let result = dp[amount]
    return result ?? -1
}
