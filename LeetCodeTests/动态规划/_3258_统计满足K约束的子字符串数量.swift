//
//  _3258_统计满足K约束的子字符串数量.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/12.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


typealias CharacterCountTuple = (byts: [Int], oneCount: Int)
func countKConstraintSubstrings(_ s: String, _ k: Int) -> Int {
    /// dp(n) 以下标n结尾的所有符合约束k的字符串数组,  类型为 CharacterCountTuple
    /// k小于等于0，返回0，无数据满足，以下基于k > 0
    /// dp(0) = [([s[0]], s[0])], dp(1) = [s[0...1],s[1]]
    /// dp(n) = dp(n-1).map { $0+s[n] }.filer { 不符合约束的，即0的数量和k的数量均大于k }
    /// 结果为，dp(0)+dp(1)+...+dp(n)
    ///
    
    if k <= 0 {
        return 0
    }

    let nums: [Int] = Array<Character>(s).map { Int(String($0)) ?? 0 }
    if nums.count == 0 {
        return 0
    }
    
    var dp: [CharacterCountTuple] = []
    var result = 0
    for i in 0..<nums.count {
        let tmp = dp
        dp = [([nums[i]], nums[i])]
        
        for j in 0..<tmp.count {
            var tuple = tmp[j]
            if nums[i] == 1 {
                if tuple.oneCount + 1 <= k || tuple.byts.count - tuple.oneCount <= k {
                    tuple.byts.append(nums[i])
                    tuple.oneCount += 1
                    dp.append(tuple)
                }
            } else {
                if tuple.oneCount <= k || tuple.byts.count - tuple.oneCount + 1 <= k {
                    tuple.byts.append(nums[i])
                    dp.append(tuple)
                }
            }
        }
        result += dp.count
        print("i = \(i), dp = \(dp), result = \(result)")
    }
    
    return result
}
