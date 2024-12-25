//
//  _3_无重复字符的最长子串.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/2.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/

import Foundation


private
func lengthOfLongestSubstring(_ s: String) -> Int {
    var arr: [Character] = Array(s)
    var map: [Character: Int] = [:]
    var result = 0
    var befer = 0
    for i in 0..<arr.count {
        if let index = map[arr[i]] {
            for j in befer..<index {
                map[arr[j]] = nil
            }
            map[arr[i]] = i
            befer = index + 1
        } else {
            map[arr[i]] = i
//            result = max(result, map.keys.count)
            result = max(result, i - befer + 1)
        }
        print("i = \(i), map = \(map)")
    }
    return result
}



private
func lengthOfLongestSubstring2(_ s: String) -> Int {
    /***
    定义dp：dp(i), 表示以i为结尾的最长公共子串长度 i属于 [0, count)
    初始值：dp(0) = 0, dp(1) = 1
    状态转移： dp(i)
    s中 i - dp(i-1) 到 i-1,中是否含有s[i]，没有含有则： dp(i) += 1
    如果含有，相同的下标为k，则 dp(i) = i - k
    
    */
    guard s.count > 0 else { return 0 }
    var dp = 1
    var maxV = dp
    let arr = Array(s)
    var map = [arr[0] : 0]
    var start: Int
    var end: Int
    
    for i in 1..<arr.count {
        if let idx = map[arr[i]] {
            // 有重复
            // 之前开始计算的点
            start = i - dp
            dp = i - idx
            
            // 新的开始计算的点
            end = i - dp
            // 更新的新字符串，需要释放旧的值
            for j in start..<end {
                // 清空
                map[arr[j]] = nil
            }
        }else {
            dp += 1
            maxV = max(maxV, dp)
        }
        map[arr[i]] = i
//        print(map)
    }
    
    return maxV
}

func lengthOfLongestSubstring1(_ s: String) -> Int {
    /***
    定义dp：dp(i), 表示以i为结尾的最长公共子串长度 i属于 [0, count)
    初始值：dp(0) = 0, dp(1) = 1
    状态转移： dp(i)
    s中 i - dp(i-1) 到 i-1,中是否含有s[i]，没有含有则： dp(i) += 1
    如果含有，相同的下标为k，则 dp(i) = i - k
    
    */
    guard s.count > 0 else { return 0 }
    var dp = 1
    var maxV = dp
    let arr = Array(s)
    var map = [arr[0] : 0]
    
    for i in 1..<arr.count {
        if let idx = map[arr[i]] {
//            let old = dp
            dp = i - idx
            
            // 清空
            map.removeAll()
            // 把新的元素添加一遍
            for j in 0..<dp {
                map[arr[i-j]] = i-j
            }
//            print("i = \(i), idx = \(idx), dp = \(dp), old = \(old)")
        }else {
            dp += 1
            maxV = max(maxV, dp)
            map[arr[i]] = i
        }
//        print(map)
    }
    
    return maxV
}

import XCTest

extension XCTestCase {
    func testLengthOfLongestSubstring() {
//        assert(lengthOfLongestSubstring("") == 0)
        assert(lengthOfLongestSubstring("abcabcbb") == 3)
        assert(lengthOfLongestSubstring("bbbbb") == 1)
        assert(lengthOfLongestSubstring("pwwkew") == 3)
        assert(lengthOfLongestSubstring("tmmzuxt") == 5)
        
    }
}
