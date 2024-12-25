//
//  stack.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/19.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

struct Stack<T> {
    private var list: Array<T> = []
    
    init() {
        self.init([])
    }
    
    init(_ list: [T]) {
        list.forEach {
            push($0)
        }
    }
    
    var isEmpty: Bool {
        return list.count == 0
    }
    
    var count: Int {
        return list.count
    }
    @discardableResult
    mutating func pop() -> T {
        return list.removeLast()
    }
    
    mutating func push(_ value: T) {
        list.append(value)
    }
    
    func peek() -> T {
        return list[count - 1]
    }
}
