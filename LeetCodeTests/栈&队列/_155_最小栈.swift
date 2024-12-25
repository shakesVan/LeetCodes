//
//  _155_最小栈.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/22.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

class MinStack {
    var valStack: [Int] = []
    var minStack: [Int] = []
    
    init() {
        
    }
    
    func push(_ val: Int) {
        var minValue = val
        if let tmp = minStack.last {
            minValue = min(val, tmp)
        }
        minStack.append(minValue)
        valStack.append(val)
    }
    
    func pop() {
        minStack.removeLast()
        valStack.removeLast()
    }
    
    func top() -> Int {
        valStack.last ?? 0
    }
    
    func getMin() -> Int {
        minStack.last ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
