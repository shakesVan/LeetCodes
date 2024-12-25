//
//  _3227_字符串元音游戏.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/31.
//  Copyright © 2024 范摇. All rights reserved.
// https://leetcode.cn/problems/vowels-game-in-a-string/description/?envType=problem-list-v2&envId=brainteaser

import Foundation

func doesAliceWin(_ s: String) -> Bool {
    let aeiou: [Character] = ["a", "e", "i", "o", "u"]
    let list: [Character] = Array(s)
    
    for char in list {
        if aeiou.contains(char) {
            return true
        }
    }
    return false
    
}

