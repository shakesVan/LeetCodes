//
//  链表.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/12/4.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


class FYNode {
    var val: Int = 0
    var next: FYNode?
    
    init(val: Int, next: FYNode? = nil) {
        self.val = val
        self.next = next
    }
}

import XCTest

class FYNodeCase: XCTestCase {
    func testPrintNode() {
        var arr = [FYNode]()
        // 链表初始化
        var before = FYNode.init(val: 1)
        arr.append(before)
        
        for i in 1...4 {
            let tmp = FYNode.init(val: i+1)
            arr.append(tmp)
            arr[i-1].next = tmp
        }
        
        let root = before
        
        let result = test2(root)
    
        
        
        assert(true)
        
    }
    
    func test2(_ node: FYNode) -> FYNode? {
        let root = FYNode.init(val: 0)
        root.next = node
        
        let cur: FYNode? = node
        while cur?.next != nil {
            let next = cur?.next
            cur?.next = next?.next
            next?.next = root.next
            root.next = next
        }
        
        return root.next
    }
    
    func test1(_ node: FYNode) -> FYNode {
        
        // 用数组翻转链表：
        var list = [FYNode]()
        var node: FYNode? = node
        while let tmp = node {
            list.append(tmp)
            node = tmp.next
        }
        
        list = list.reversed()
        for i in 1...4 {
            list[i-1].next = list[i]
        }
        // 输出

        return list[0]
    }
    
    
}
