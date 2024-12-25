//
//  DoubleLinkList.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

class DoubleLinkList<Element> {
    
    class DListNode: CustomStringConvertible {
        var val: Element?
        var next: DListNode? = nil
        var prev: DListNode? = nil
        
        init(val: Element? = nil, next: DListNode? = nil, prev: DListNode? = nil) {
            self.val = val
            self.next = next
            self.prev = prev
        }
        
        public var description: String {
            
            let hasNext = next == nil
            let hasPrev = prev == nil
            guard let val = val else {
                return "[]"
            }
            let result = "\(val)" + (hasNext ? "hasNext" : "") + (hasPrev ? "hasPrev" : "")
            return result
        }
    }
    
    var head: DListNode
    var tail: DListNode
    
    fileprivate var size: Int = 0
    
    init() {
        head = DListNode()
        tail = DListNode()
        
        head.next = tail
        tail.prev = head
        size = 0
    }
    
    convenience init(_ elements: [Element]) {
        self.init()
        if elements.count == 0 {
            return
        }
        
        var befer = head
        
        for i in 0..<elements.count {
            let tmp = DListNode(val: elements[i])
            tmp.prev = befer
            befer.next = tmp
            befer = tmp
        }
        
        befer.next = tail
        tail.prev = befer
        size = elements.count
        
    }
    
    func insert(_ node: DListNode, after prev: DListNode) {
        
        node.next = prev.next
        prev.next = node
        
        node.prev = prev
        node.next?.prev = node
        
        size += 1
    }
    
    @discardableResult
    func remove(_ node: DListNode) -> DListNode {
        
        guard let prev = node.prev else {
            return node
        }
        node.next?.prev = prev
        prev.next = node.next
        
        node.prev = nil
        node.next = nil
        size -= 1
        return node
    }
    
    func getSize() -> Int {
        return size
    }
    
    func moveTo(_ node: DListNode, after prev: DListNode) {
        insert(remove(node), after: prev)
    }
    
}
