//
//  _28_1.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/13.
//  Copyright © 2020 范摇. All rights reserved.
// 5423. 找两个和为目标值且不重叠的子数组

import Foundation
private
class Solution {
    func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
        // 找出所有的和为target的子数组（不考虑重叠）
        // sub[0] 到 sub[1] 为 arr 的子数组，且和为target, sub[2]为差
        var subs = [[Int]]()
        var l = 0
        var r = l
        
        var tmp = 0
        
        while r < arr.count && l < arr.count {
            tmp += arr[r]
            if tmp == target {
                subs.append([l, r, r-l+1])
                tmp -= arr[l]
                l += 1
                r += 1
                continue
            }else if tmp > target {
                tmp -= arr[l]
                l += 1
                // 准备下一次
                tmp -= arr[r]
            }else {
                r += 1
            }
        }
        if subs.count < 2 { return -1 }
        subs.sort { $0[2] < $1[2] }
//        print("subs = \(subs)")
        let ans1 = subs[0]
        var ans2 = [Int]()
        
        // 找出最小的两个（不重叠的）
        for i in 1..<subs.count {
            ans2 = subs[i]
            if (ans2[0] > ans1[1] && ans2[1] > ans1[0]) || (ans2[0] < ans1[1] && ans2[1] < ans1[0])  {
                return ans1[2] + ans2[2]
            }
        }
        
        return -1
    }
}

import XCTest

extension XCTestCase {
    func testMinSumOfLengths() {
        let s = Solution()
        var arr = [3,2,2,4,3]
        var target = 3
        assert(s.minSumOfLengths(arr, target) == 2)
        
        arr = [7,3,4,7]
        target = 7
        assert(s.minSumOfLengths(arr, target) == 2)
        arr = [4,3,2,6,2,3,4]
        target = 6
        assert(s.minSumOfLengths(arr, target) == -1)
        
        arr = [5,5,4,4,5]
        target = 3
        assert(s.minSumOfLengths(arr, target) == -1)
        
        arr = [3,1,1,1,5,1,2,1]
        target = 3
        assert(s.minSumOfLengths(arr, target) == 3)
        
        arr = [31,1,1,18,15,3,15,14]
        target = 33
        assert(s.minSumOfLengths(arr, target) == 5)
        
        
    }
}
