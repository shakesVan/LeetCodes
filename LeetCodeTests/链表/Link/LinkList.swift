//
//  Node.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/23.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

/// 双向链表
fileprivate struct ElementDoubleLinkList<Element> {
    var first: Node?
    var last: Node?
    private var size: Int = 0
    
    init(_ vals: [Element]) {
        guard vals.count > 0 else { return }
        self.last = Node(vals[0])
        self.first = last
        for v in vals {
            insert(v, at: size)
        }
        return
    }
    
    func sized() -> Int {
        return size
    }
    
    mutating func insert(_ val: Element,at index: Int) {
        guard index <= size else {
            fatalError("添加越界")
        }
        
        var node: Node?
        var index = index
        if index > (size >> 1) {
            // 向后找
            node = last
            while index > 0 {
                node = node?.prev
                index -= 1
            }
            return
        }else {
            node = first
            while index > 0 {
                node = node?.next
                index -= 1
            }
        }
        
        let new = Node(val)
        new.next = node
        new.prev = node?.prev
        node?.prev?.next = new
        node?.prev = new
        
        size += 1
    }
    
    
    mutating func remove(at index: Int) -> Element {
        guard index < size else {
            fatalError("删除越界")
        }
        var index = index
        var node: Node?
        if index > (size >> 1) {
            // 向后找
            node = last
            while index > 0 {
                node = node?.prev
                index -= 1
            }
        }else {
            node = first
            while index > 0 {
                node = node?.next
                index -= 1
            }
        }
        
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
        size -= 1
        return (node?.val)!
    }

    fileprivate class Node {
        fileprivate var val: Element
        fileprivate var prev: Node?
        fileprivate var next: Node?
        
        fileprivate init(_ val: Element) {
            self.val = val
        }
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static public func listNode(_ vals: [Int]) -> ListNode? {
        guard vals.count > 0 else { return nil }
        var node: ListNode? = ListNode(vals[0])
        let root = node
        for val in 0..<vals.count {
            node?.next = ListNode(vals[val])
            node = node?.next
        }
        return root?.next
    }
    
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        var node: ListNode? = self
        var printS = "["
        while node != nil {
            printS += "\(node!.val)"
            node = node!.next
            if node != nil {
                printS += ","
            }
        }
        printS += "]"
        return printS
        
    }
}
