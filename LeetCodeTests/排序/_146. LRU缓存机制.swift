//
//  _146. LRU缓存机制.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/25.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode.cn/problems/lru-cache/description/?envType=study-plan-v2&envId=top-100-liked

import Foundation

fileprivate
typealias Element = (key: Int, value: Int)

fileprivate
class LRUDoubleLinkList<Element> {
    
    class LRUListNode: CustomStringConvertible {
        var val: Element?
        var next: LRUListNode? = nil
        var prev: LRUListNode? = nil
        
        init(val: Element? = nil, next: LRUListNode? = nil, prev: LRUListNode? = nil) {
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
    
    var head: LRUListNode
    var tail: LRUListNode
    
    fileprivate var size: Int = 0
    
    init() {
        head = LRUListNode()
        tail = LRUListNode()
        
        head.next = tail
        tail.prev = head
        size = 0
    }
    
    convenience init(keyValues: [Element]) {
        self.init()
        if keyValues.count == 0 {
            return
        }
        
        var befer = head
        
        for i in 0..<keyValues.count {
            let tmp = LRUListNode(val: keyValues[i])
            tmp.prev = befer
            befer.next = tmp
            befer = tmp
        }
        
        befer.next = tail
        tail.prev = befer
        size = keyValues.count
        
    }
    
    func insert(_ node: LRUListNode, after prev: LRUListNode) {
        
        node.next = prev.next
        prev.next = node
        
        node.prev = prev
        node.next?.prev = node
        
        size += 1
    }
    
    @discardableResult
    func remove(_ node: LRUListNode) -> LRUListNode {
        
        guard let prev = node.prev else {
            return node
        }
        prev.next = node.next
        prev.next?.prev = prev
        
        node.prev = nil
        node.next = nil
        size -= 1
        return node
    }
    
    func moveTo(_ node: LRUListNode, after prev: LRUListNode) {
        insert(remove(node), after: prev)
    }
    
}


class LRUCache {

    fileprivate var doubleLinkList: LRUDoubleLinkList<Element>
    fileprivate var map: [Int: LRUDoubleLinkList<Element>.LRUListNode]
    var capacity: Int = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
        doubleLinkList = LRUDoubleLinkList<Element>()
        map = [:]
    }
    
    func get(_ key: Int) -> Int {
        
        guard let node = map[key],
              let value = node.val?.value else {
            // 未找到
            return -1
        }
        
        // node移至最前
        doubleLinkList.moveTo(node, after: doubleLinkList.head)
        print("get======= key = \(key), map = \(map), capacity = \(capacity)")
        
        return value
    }
    
    func put(_ key: Int, _ value: Int) {
        
        
        // 判断是否有该key，如果有删除旧的
        if let old = map[key] {
            
            doubleLinkList.remove(old)
            
            // 如果没有，判断是否容量不够，如果不够删除最后一个
        } else if doubleLinkList.size == capacity,
                  let last = doubleLinkList.tail.prev {
            
            doubleLinkList.remove(last)
            
            if let lastKey = last.val?.key {
                map[lastKey] = nil
            }
        }
        
        let node = LRUDoubleLinkList<Element>.LRUListNode()
        node.val = (key, value)
        doubleLinkList.insert(node, after: doubleLinkList.head)
        map[key] = node
        
        
        print("put======== key = \(key), map = \(map), capacity = \(capacity)")
    }
}






struct PriorityQueue1<Key: Hashable, Element: Comparable> {
    struct KeyValue {
        var key: Key
        var value: Element
        init(_ key: Key, _ value: Element) {
            self.key = key
            self.value = value
        }
    }
    private var _teap: Array<KeyValue?>
    private var _map: [Key: Element] = [:]
    private var _size: Int = 0
    private var _capacity: Int
    
    init(_ capacity: Int) {
        _teap = Array<KeyValue?>()
        _capacity = capacity
    }
    
    mutating func get(_ key: Key) -> Element? {
        // 调整_array的顺序
        guard let value = _map[key] else { return nil }
        refleshKey(key, value)
        return value
    }
    
    mutating func refleshKey(_ key: Key, _ value: Element) {
        var removeIndex = 0
        for kv in _teap {
            if kv?.key == key {
                break
            }
            removeIndex += 1
        }
        var kv = _teap.remove(at: removeIndex)
        kv?.value = value
        _teap.insert(kv, at: 0)
    }
    
    mutating func put(_ key: Key, _ value: Element) {
        guard let _ = _map[key] else {

            _map[key] = value
            if _size >= _capacity {
                // 下滤
                let kv = _teap.removeLast()
                _map[kv!.key] = nil
            }else {
                _size += 1
            }

            _teap.insert(KeyValue(key, value), at: 0)
            return
        }
        
        _map[key] = value
        // 判断是否容量不足，如果容量不足就删除，堆顶元素
        
        refleshKey(key, value)
//        _teap.insert(KeyValue(key, value), at: 0)
        
    }
}


class LRUCache1 {
    var queue: PriorityQueue1<Int, Int>
    
    init(_ capacity: Int) {
        queue = PriorityQueue1.init(capacity)
    }
    
    func get(_ key: Int) -> Int {
        return queue.get(key) ?? -1
    }
    
    func put(_ key: Int, _ value: Int) {
        queue.put(key, value)
    }
}

import XCTest

class LRUCacheCase: XCTestCase {
    
    func testLRUCache() {
        let cache = LRUCache.init(2)
        cache.put(1, 1)
        cache.put(2, 2)
        assert(cache.get(1) == 1)       // 返回  1
        cache.put(3, 3)    // 该操作会使得关键字 2 作废
        
        assert(cache.get(2) == -1) // 返回 -1 (未找到)
        cache.put(4, 4)    // 该操作会使得关键字 1 作废
             
        
        assert(cache.get(1) == -1)  // 返回 -1 (未找到)
        assert(cache.get(3) == 3)  // 返回  3
        assert(cache.get(4) == 4) // 返回  4
       

    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
