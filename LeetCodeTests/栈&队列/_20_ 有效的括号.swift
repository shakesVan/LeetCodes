//
//  _20_ 有效的括号.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/4.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate
func isValid(_ s: String) -> Bool {
    let chars: [Character] = Array(s)
    
    let map: [Character: Character] = [
        ")": "(",
        "]": "[",
        "}": "{",
    ]
    
    
    var stack = Stack<Character>()
    
    for char in chars {
        guard let tmp = map[char] else {
            // 无key则入栈
            stack.push(char)
            continue
        }
            
        guard !stack.isEmpty,
              stack.peek() == tmp  else {
            return false
        }
        stack.pop()
    }
    return stack.isEmpty
}

