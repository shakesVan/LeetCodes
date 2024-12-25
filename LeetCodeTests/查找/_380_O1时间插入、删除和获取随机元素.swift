//
//  _380_O1时间插入、删除和获取随机元素.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


class RandomizedSet {

    var map: [Int: Int] = [:]
    init() {
    }
    
    func insert(_ val: Int) -> Bool {
        if map[val] != nil {
            return false
        }
        map[val] = val
        
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let val = map[val] else {
            return false
        }
        map[val] = nil
        return true
    }
    
    func getRandom() -> Int {
        let rand = Int.random(in: 0..<map.count)
        let key = Array(map.keys)[rand]
        return map[key] ?? 0
    }
}


class RandomizedSet1 {

    var map: [Int: DoubleLinkList<Int>.DListNode] = [:]
    var doubleLinkList: DoubleLinkList<Int> = DoubleLinkList.init([])
    
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        if map[val] != nil {
            return false
        }
        var node = DoubleLinkList.DListNode(val: val)
        map[val] = node
        doubleLinkList.insert(node, after: doubleLinkList.head)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let node = map[val] else {
            return false
        }
        map[val] = nil
        doubleLinkList.remove(node)
        return true
    }
    
    func getRandom() -> Int {
        let rand = Int.random(in: 0..<doubleLinkList.getSize())
        let key = Array(map.keys)[rand]
        return map[key]?.val ?? 0
    }
}
