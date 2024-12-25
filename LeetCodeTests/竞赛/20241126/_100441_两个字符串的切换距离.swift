//
//  _100441_两个字符串的切换距离.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/23.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func shiftDistance(_ s: String, _ t: String, _ nextCost: [Int], _ previousCost: [Int]) -> Int {
    // sa: Array(s)
    // ta: Array(t)
    // dp(n) 移动前n个所需要的次数
    // dp(0): min(nextCost[sa[0]..<ta[0]]求和, previousCost[(ta[0]+1)...sa[0]]求和) sa[0] < ta[0] 越界需+-26
    // dp(n) = dp(n-1) + min(nextCost[sa[n]..<ta[n]]求和, previousCost[(ta[n]+1)...sa[n]]求和)
    let sa: [Character] = Array(s)
    let ta: [Character] = Array(t)
    var dp = 0
    
    guard sa.count == ta.count else {
        return dp
    }
    
    for i in 0..<sa.count {
        dp += getValue(sa[i], to: ta[i], nextCost, previousCost)
    }
    
    return dp
}


func getValue(_ char: Character, to target: Character, _ nextCost: [Int], _ previousCost: [Int]) -> Int {
    if char == target {
        return 0
    }
    let aAV = Int(Character("a").asciiValue ?? 0)
    let charAV = Int(char.asciiValue ?? 0)
    let targetAV = Int(target.asciiValue ?? 0)
    
    let charIndex = charAV - aAV
    var targetIndex = targetAV - aAV
    
    var result = Int.max
    if charIndex < targetIndex {
        var tmp = 0
        
        for i in charIndex..<targetIndex {
            tmp += getCostValue(in: nextCost, with: i)
        }
        result = min(result, tmp)
        tmp = 0
        for i in (targetIndex+1)...(charIndex+previousCost.count) {
            tmp += getCostValue(in: previousCost, with: i)
        }
        result = min(result, tmp)
    } else {
        var tmp = 0
        
        for i in (charIndex-nextCost.count)..<targetIndex {
            tmp += getCostValue(in: nextCost, with: i)
        }
        result = min(result, tmp)
        tmp = 0
        for i in (targetIndex+1)...charIndex {
            tmp += getCostValue(in: previousCost, with: i)
        }
        result = min(result, tmp)
    }
    return result
}

func getCostValue(in needCoolArray: [Int], with index: Int) -> Int {
    var index = index
    if index < 0 {
        index += needCoolArray.count
    } else if index >= needCoolArray.count {
        index -= needCoolArray.count
    }
    return needCoolArray[index]
}
