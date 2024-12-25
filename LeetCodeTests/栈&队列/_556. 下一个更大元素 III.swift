//
//  _556. 下一个更大元素 III.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/12.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/next-greater-element-iii/

import Foundation
private
class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        guard n > 10 else { return -1 }
        
        var arr = [Int]()
        var tmp = n
        // 获取数字数组
        while tmp > 0 {
            arr.append(tmp % 10)
            tmp /= 10
        }
        // 找是否是存在逆序对，如果不存在就返回-1
        // 此时已经是倒叙了，查找是否有降序即可
        var idx = -1
        for i in 1..<arr.count {
            if arr[i-1] > arr[i] {
                idx = i
                break
            }
        }
        // 不存在就返回-1
        if idx == -1 { return -1 }
        // 寻找刚好比idx大的数
        let idx_1 = idx - 1
        var minMaxIdx = idx_1
        for i in 0..<idx_1 {
            if arr[i] > arr[idx] && arr[i] < arr[minMaxIdx] {
                minMaxIdx = i
            }
        }

        // 交换 第一个比i大的值
        tmp = arr[minMaxIdx]
        arr[minMaxIdx] = arr[idx]
        arr[idx] = tmp
        
        // 调整 0 到 idx-1的 顺序，使其降序
        arr[...idx_1].sort(by: >)
        var ans = 0
        var mut = 1
        for item in arr {
            ans += item * mut
            mut *= 10
        }
        return ans > Int32.max ? -1 : ans
    }
}

import XCTest

extension XCTestCase {
    func testnextGreaterElement() {
        let s = Solution()
//        assert(s.nextGreaterElement(12) == 21)
//        assert(s.nextGreaterElement(21) == -1)
//
//        assert(s.nextGreaterElement(230241) == 230412)
//        assert(s.nextGreaterElement(12443322) == 13222344)
        assert(s.nextGreaterElement(1999999999) == -1)
        
//        230241
//        230412
//        230421
    }
        
}
