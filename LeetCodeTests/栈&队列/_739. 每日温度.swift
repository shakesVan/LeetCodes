//
//  _739. 每日温度.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/11.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/daily-temperatures/

import Foundation

private
class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        guard T.count > 0 else { return [] }
        
        // 0 为下标
        var stack = Stack<Int>()
        // 到达天数
        var arr = Array<Int>.init(repeating: 0, count: T.count)

        for i in 0..<T.count {
            let ti = T[i]
            arr[i] = 0
            if stack.isEmpty {
                stack.push(i)
               continue
            }
            var top = stack.peek()
            while !stack.isEmpty && { top = stack.peek(); return ti > T[top] }() {
                arr[top] = i - top
                stack.pop()
            }
            stack.push(i)
        }
        return arr
    }
    
    func dailyTemperatures2(_ T: [Int]) -> [Int] {
        guard T.count > 0 else { return [] }
        
        // 0 为下标，1 为温度
        var stack = Stack<[Int]>()
        // key 为下标，value 为到达天数
        var arr = Array<Int>.init(repeating: 0, count: T.count)
        stack.push([0, T[0]])
        arr[0] = 0

        for i in 0..<T.count {
            let ti = T[i]
            arr[i] = 0
            if stack.isEmpty {
                stack.push([i,ti])
               continue
            }
            var top = stack.peek()
            while ti > top[1] {
                arr[top[0]] = i - top[0]
                stack.pop()
                if stack.isEmpty { break }
                top = stack.peek()
            }
            stack.push([i,ti])
        }
        return arr
    }
    
    func dailyTemperatures1(_ T: [Int]) -> [Int] {
        guard T.count > 0 else { return [] }
        
        // 0 为下标，1 为温度
        var stack = Stack<[Int]>()
        // key 为下标，value 为到达天数
        var map = [Int: Int]()
        stack.push([0, T[0]])
        map[0] = 0

        for i in 1..<T.count {
            let ti = T[i]
            map[i] = 0
            if stack.isEmpty {
                stack.push([i,ti])
               continue
            }
            var top = stack.peek()
            while ti > top[1] {
                map[top[0]] = i - top[0]
                stack.pop()
                if stack.isEmpty { break }
                top = stack.peek()
            }
            stack.push([i,ti])
        }
        let ans = T.enumerated().map { map[$0.offset] ?? 0 }
        print("map == \(map)")
        
        print("ans == \(ans)")
        return ans
    }
}

import XCTest

extension XCTestCase {
    func testdailyTemperatures() {
        let s = Solution()
        let t = [73, 74, 75, 71, 69, 72, 76, 73]
        assert(s.dailyTemperatures(t) == [1, 1, 4, 2, 1, 1, 0, 0])
        
    }
}
