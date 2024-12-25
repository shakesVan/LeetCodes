//
//  _5399. 数位成本和为目标值的最大数字.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/16.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/biweekly-contest-26/problems/form-largest-integer-with-digits-that-add-up-to-target/
/// 未解决
import Foundation
private
class Solution {
    func largestNumber(_ cost: [Int], _ target: Int) -> String {
        var map = [Int: Int]()
        for i in 1...cost.count {
            map[cost[i-1]] = i
        }
        let upA = map.keys.sorted()
        
        
//        maxValueExactly(<#T##weights: [Int]##[Int]#>, <#T##values: [Int]##[Int]#>, target)
        
        var result = [Int]()
        if largestNumber(map, target, upA, &result, 0) {
            return result.sorted(by: >).reduce("", { $0 + String($1)})
        }
        
        
        return "0"
    }
    
    func largestNumber(_ map: [Int: Int], _ target: Int, _ upA: [Int], _ result: inout [Int], _ idx: Int) -> Bool {
        print("target = \(target), result = \(result), upA = \(upA)")
        // 成功找到
        if target == 0 { return true }
        guard upA.count > idx else { return false }
        let minV = upA[idx]
        if minV > target {
            result.removeLast()
            return largestNumber(map, target + minV, upA, &result, idx + 1)
        }else {
            result.append(map[minV]!)
            return largestNumber(map, target - minV, upA, &result,idx)
        }
        
    }
}

private
func maxValueExactly(_ weights: [Int], _ values: [Int], _ maxWeight: Int) -> Int {
    guard maxWeight > 0 else { return 0; }
    let m = weights.count
   
    guard m == values.count && m > 0 else { return 0 }
    
    var dp = Array(repeating: Int.min, count: maxWeight + 1)
    dp[0] = 0
    for i in 1...m {
        if maxWeight < weights[i-1] { continue }
        for j in (weights[i-1]...maxWeight).reversed() {
            dp[j] = max(dp[j], dp[j - weights[i-1]] + values[i-1])
                
        }
    }
//    print(dp)
    return dp[maxWeight] < 0 ? -1 : dp[maxWeight]
}

import XCTest

extension XCTestCase {
    func testLargestNumber() {
        
//        assert(Solution().largestNumber([4,3,2,5,6,7,2,5,5], 9) == "7772")
//        assert(Solution().largestNumber([7,6,5,5,5,6,8,7,8], 12) == "85")
//        assert(Solution().largestNumber([2,4,6,2,4,6,4,4,4], 5) == "0")
//        assert(Solution().largestNumber([2,4,6,2,4,6,4,4,4], 4) == "44")
        assert(Solution().largestNumber([6,10,15,40,40,40,40,40,40], 47) == "32211")
    }
}
