//
//  _5390_数青蛙.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/19.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func minNumberOfFrogs(_ croakOfFrogs: String) -> Int {
    guard croakOfFrogs.count > 0 else { return -1 }
    let words = Array("croak")
    var wordsMap = [Character: Int]()
    for i in 0..<words.count {
        wordsMap[words[i]] = i
    }
    var croaks = Array(repeating: 0, count: words.count)
    // 最少需要的青蛙数量
    var result = 0
    for char in croakOfFrogs {
        guard let index = wordsMap[char] else { return -1 }
        switch index {
        case 0:
            // 如果是第一个字母时，判断是否有刚结束的青蛙，如果有重复利用，可用青蛙数-1
            // 否则必须要有一只新的青蛙
            if croaks[croaks.count - 1] > 0 {
                croaks[croaks.count - 1] -= 1
            }else {
                result += 1
            }
            croaks[index] += 1
        default:
            croaks[index-1] -= 1
            croaks[index] += 1
//            break
        }
        // 中途不允许有小于0的数
        for i in 0..<croaks.count-1 {
            if croaks[i] < 0 { return -1 }
        }
//        print("croaks == \(croaks)")
    }
    // 最终前面的都要归零
    for i in 0..<croaks.count-1 {
        if croaks[i] != 0 { return -1 }
    }
//    print("result == \(result)")
    return result
}

func minNumberOfFrogs2(_ croakOfFrogs: String) -> Int {
    guard croakOfFrogs.count > 0 else {
        return -1
    }
    guard croakOfFrogs.count % 5 == 0 else {
        return -1
    }
    let words = Array("croak")
    var wordsMap = [Character: Int]()
    for i in 0..<words.count {
        wordsMap[words[i]] = i
    }
    
    var list = Array(repeating: 0, count: 5)
    let croaks = Array(croakOfFrogs)
    
    var maxV = 0
    for char in croaks {
        // 取得下标
        guard let index = wordsMap[char] else { return -1 }
        
        
        list[index] += 1
        if index != 0 {
            if list[index-1] < list[index] + 1 {
                return -1
            }
            list[index-1] -= 1
        }
        
        if index != 5 {
            var tmp = 0
            for i in 0..<4 {
                if list[i] != 0 {
                    tmp += 1
                }
            }
            
            maxV = max(tmp, maxV)
        }
        print("maxV === \(maxV)")
    }
    
    for i in 0..<4 {
        if list[i] != 0 {
            return -1
        }
    }
    
    return maxV
}


// 超时
func minNumberOfFrogs1(_ croakOfFrogs: String) -> Int {
    guard croakOfFrogs.count > 0 else {
        return -1
    }
    guard croakOfFrogs.count % 5 == 0 else {
        return -1
    }
    let words = Array("croak")
    var wordsMap = [Character: Int]()
    for i in 0..<words.count {
        wordsMap[words[i]] = i
    }
    
    var stacks = [Stack<Character>]()
    let croaks = Array(croakOfFrogs)
    
    // 取出每个元素，判断能否入已知的栈，如果可以，入栈，如果不能新建一个栈，判断是否能入
    for char in croaks {
        if wordsMap[char] == nil { return -1 }
        var flag = false
        for i in 0..<stacks.count {
            if (stacks[i].count % 5) == wordsMap[char] {
                stacks[i].push(char)
                flag = true
//                print("stacks === \(stacks)")
                break
            }
        }
        // 如果没有找到，判断是不是第一个
        if flag { continue }
        if !flag && wordsMap[char] != 0 {
            return -1
        }
        
        var st = Stack<Character>()
        st.push(char)
        stacks.append(st)
        
//        print("stacks === \(stacks)")
    }
    
    return stacks.count
}

import XCTest

extension XCTestCase {
    func testMinNumberOfFrogs() {
        assert(minNumberOfFrogs("croakcroak") == 1)
        assert(minNumberOfFrogs("crcoakroak") == 2)
        assert(minNumberOfFrogs("croakcrook") == -1)
        assert(minNumberOfFrogs("croakcroa") == -1)
        assert(minNumberOfFrogs("aoocrrackk") == -1)
    }
}


