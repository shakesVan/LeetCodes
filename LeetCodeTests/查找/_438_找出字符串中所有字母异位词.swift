//
//  _438_找出字符串中所有字母异位词.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/25.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/find-all-anagrams-in-a-string/?envType=study-plan-v2&envId=top-100-liked

import Foundation


func findAnagrams(_ s: String, _ p: String) -> [Int] {
    
    // 转为数组
    let pArr = Array(p).map { String($0) }
    let sArr = Array(s).map { String($0) }
    
    if pArr.count > sArr.count {
        return []
    }
    var pConutMap = [String: Int]()
    var sConutMap = [String: Int]()
    
    for i in 0..<pArr.count {
        pConutMap[pArr[i]] = (pConutMap[pArr[i]] ?? 0) + 1
        sConutMap[sArr[i]] = (sConutMap[sArr[i]] ?? 0) + 1
    }
    
    var result = [Int]()
    if isEqual(map1: pConutMap, map2: sConutMap) {
        result.append(0)
    }
    
    if pArr.count == sArr.count {
        return result
    }
    
    let end = sArr.count - pArr.count + 1
    for i in 1..<end {
        let newIndex = i + pArr.count - 1
        if let value = sConutMap[sArr[i - 1]],
           value > 1 {
            sConutMap[sArr[i - 1]] = value - 1
        } else {
            sConutMap[sArr[i - 1]] = nil
        }
        
        sConutMap[sArr[newIndex]] = (sConutMap[sArr[newIndex]] ?? 0) + 1
        
        if isEqual(map1: pConutMap, map2: sConutMap) {
            result.append(i)
        }
    }
    
    return result
}

func isEqual(map1: [String: Int], map2: [String: Int]) -> Bool {
    guard map1.keys.count == map2.keys.count,
          map1.values.count == map2.values.count else {
        print("map1 = \(map1), map2 = \(map2)")
        return false
    }
    
      print("map1 = \(map1), map2 = \(map2)")
    let keys = map1.keys
    
    for key in keys {
        if map1[key] != map2[key] {
            return false
        }
    }
    
    
    return true
}

// 超时原因，算法时间复杂度O(n^2)
func findAnagrams1(_ s: String, _ p: String) -> [Int] {
    // 转为数组
    let pArr = Array(p).map { String($0) }
    var pMap = [String: Int]()
    for ps in pArr {
        if pMap[ps] == nil {
            pMap[ps] = 0
        }
        pMap[ps] = 1 + (pMap[ps] ?? 0)
    }
    
    
    let sArr = Array(s).map { String($0) }
    // 遍历目标字符串
    guard sArr.count >= pArr.count else {
        return []
    }
    let count = sArr.count - pArr.count
    
    var tmpMap: [String: Int] = [:]
    var result = [Int]()
    for i in 0...count {
        let end = i + pArr.count
        let targetArr = sArr[i..<end]
        
        var flag = true
        tmpMap = pMap
        
        for targetS in targetArr {
            guard let targetSCount = tmpMap[targetS],
                  targetSCount != 0 else {
                flag = false
                break
            }
            tmpMap[targetS] = targetSCount - 1
            
        }
        if flag {
            result.append(i)
        }
        
    }
    return result
}


