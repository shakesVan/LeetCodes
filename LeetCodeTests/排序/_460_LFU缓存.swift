//
//  _460_LFU.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/11.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate
typealias Element = (key: Int, value: Int, time: Int)

fileprivate
class LFUDoubleLinkList<Element> {
    
    class LFUListNode: CustomStringConvertible {
        var val: Element?
        var next: LFUListNode? = nil
        var prev: LFUListNode? = nil
        
        init(val: Element? = nil, next: LFUListNode? = nil, prev: LFUListNode? = nil) {
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
    
    var head: LFUListNode
    var tail: LFUListNode
    
    fileprivate var size: Int = 0
    
    init() {
        head = LFUListNode()
        tail = LFUListNode()
        
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
            let tmp = LFUListNode(val: keyValues[i])
            tmp.prev = befer
            befer.next = tmp
            befer = tmp
        }
        
        befer.next = tail
        tail.prev = befer
        size = keyValues.count
        
    }
    
    func insert(_ node: LFUListNode, after prev: LFUListNode) {
        
        node.next = prev.next
        prev.next = node
        
        node.prev = prev
        node.next?.prev = node
        
        size += 1
    }
    
    @discardableResult
    func remove(_ node: LFUListNode) -> LFUListNode {
        
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
    
    func moveTo(_ node: LFUListNode, after prev: LFUListNode) {
        insert(remove(node), after: prev)
    }
    
}


class LFUCache {

    fileprivate var map: [Int: LFUDoubleLinkList<Element>.LFUListNode]
    fileprivate var timeMap: [Int: LFUDoubleLinkList<Element>]
    var capacity: Int = 0
    var size: Int = 0
    fileprivate var maxTime = 1
    
    init(_ capacity: Int) {
        self.capacity = capacity
        map = [:]
        timeMap = [:]
    }
    
    func get(_ key: Int) -> Int {
        
        guard let node = map[key],
              let val = node.val else {
            // 未找到
            return -1
        }
        
        var time = val.time
        timeMap[time]?.remove(node)
        if timeMap[time]?.size == 0 {
            timeMap[time] = nil
        }
        
        time += 1
        maxTime = max(time, maxTime)
        node.val?.time = time
        
        var linkList: LFUDoubleLinkList<Element>
        
        if let tmp = timeMap[time] {
            linkList = tmp
        } else {
            linkList = LFUDoubleLinkList()
        }
        
        linkList.insert(node, after: linkList.head)
        timeMap[time] = linkList
        
//        print("get======= key = \(key), map = \(map), timeMap.keys = \(timeMap.keys), size = \(size)")
        
        return val.value
    }
    
    fileprivate
    func removeLastInTimeMap(with time: Int, node: LFUDoubleLinkList<Element>.LFUListNode? = nil) {
        
        guard let linkList = timeMap[time],
              let last = linkList.tail.prev else {
            print("未找到数据 time = \(time), timeMap.keys = \(timeMap.keys) ")
            return
        }
        let target = node ?? last
        
        linkList.remove(target)
        if linkList.size == 0 {
            timeMap[time] = nil
        } else {
            timeMap[time] = linkList
        }
//        print("找到数据 time = \(time), target = \(target), timeMap[\(time)] = \(timeMap[time]?.tail.prev?.val) ")
        size -= 1
    }
    
    func put(_ key: Int, _ value: Int) {
        
        var time = 0
        // 判断是否有该key，如果有删除旧的，重新添加
        if let old = map[key] {
            time = old.val?.time ?? 0
            removeLastInTimeMap(with: time, node: old)
            
            // 如果没有，判断是否容量不够，如果不够删除最后一个
        } else if size == capacity {
            // 找出最后一个
            for i in 1...maxTime {
                guard let linkList = timeMap[i] else {
                    continue
                }
                guard let last = linkList.tail.prev,
                      let lastKey = last.val?.key else {
                    // 数据异常
                    print("数据异常， linkList = \(linkList), 无last")
                    break
                }
//                print("i = \(i), linkList = \(linkList)")
//                print("i = \(i), last = \(last), last.val = \(last.val!)")
                
                removeLastInTimeMap(with: i)
                map[lastKey] = nil
                break
            }
        }
        
        let node = LFUDoubleLinkList<Element>.LFUListNode()
        time += 1
        maxTime = max(time, maxTime)
        node.val = (key, value, time)
        
        var linkList: LFUDoubleLinkList<Element>
        if let tmp = timeMap[time] {
            linkList = tmp
        } else {
            linkList = LFUDoubleLinkList()
        }
        linkList.insert(node, after: linkList.head)
        timeMap[time] = linkList
        
        map[key] = node
        size += 1
        
//        print("put======== key = \(key), map = \(map), timeMap.keys = \(timeMap.keys), size = \(size)")
        
    }
}


import XCTest

class LFUCacheCase: XCTestCase {
    
    func testLFUCache() {
        let cache = LFUCache.init(2)
        cache.put(1, 1)
        cache.put(2, 2)
        assert(cache.get(1) == 1)       // 返回  1
        cache.put(3, 3)    // 该操作会使得关键字 2 作废
        
        assert(cache.get(2) == -1) // 返回 -1 (未找到)
        cache.put(4, 4)    // 该操作会使得关键字 1 作废
             
        
        assert(cache.get(3) == -1)  // 返回 -1 (未找到)
        assert(cache.get(1) == 1)  // 返回  1
        assert(cache.get(4) == 4) // 返回  4
       

    }
}
