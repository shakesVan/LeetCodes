//
//  _232_用栈实现队列.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/22.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

class MyQueue {

    var pushStack: Stack<Int> = Stack()
    var popStack: Stack<Int> = Stack()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        pushStack.push(x)
    }
    
    func pop() -> Int {
        if popStack.count > 0 {
            return popStack.pop()
        }
        pushToPop()
        return popStack.pop()
    }
    
    func peek() -> Int {
        if popStack.count > 0 {
            return popStack.peek()
        }
        pushToPop()
        return popStack.peek()
    }
    
    fileprivate
    func pushToPop() {
        while !pushStack.isEmpty  {
            popStack.push(pushStack.pop())
        }
    }
    
    func empty() -> Bool {
        popStack.isEmpty && pushStack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
