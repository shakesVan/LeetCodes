//
//  Queue.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/24.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

fileprivate class LinkList<Element> {
    var first: Node?
    var last: Node?
    private var size: Int = 0
    
    init(_ vals: [Element]) {
        guard vals.count > 0 else { return }
        var last: Node? = Node(vals[0])
        let first = last
        for v in vals {
            last?.next = Node(v)
            last = last?.next
        }
        self.first = first?.next
        self.last = last
        return
    }
    
    func sized() -> Int {
        return size
    }
    
    func append(_ val: Element) {
        let node = Node(val)
        if size == 0 {
            first = node
            last = node
            size = 1
            return
        }
        last?.next = Node(val)
        last = last?.next
        size += 1
    }
    
    func removeFirst() -> Element {
        
        let tmp = first?.val
        first = first?.next
        if size == 1 {
            last = nil
        }
        size -= 1
        return tmp!
    }

    fileprivate class Node {
        fileprivate var val: Element
        fileprivate var next: Node?
        
        fileprivate init(_ val: Element) {
            self.val = val
            self.next = nil
        }
    }
}


public struct Queue<Element> {
    private var list: LinkList<Element>
    
    public func isEmpty() -> Bool {
        return list.sized() == 0
    }
    public func sized() -> Int {
        return list.sized()
    }
    
    public init(_ list: Array<Element>) {
        
        self.list = LinkList<Element>(list)
    }
    
    public init() {
        self.init([])
    }
    
    public mutating func inQueue(_ e: Element) {
        list.append(e)
    }
    
    public mutating func deQueue() -> Element {
        return list.removeFirst()
    }
    
    public func peek() -> Element? {
        return list.first?.val
    }
}
