//
//  Trie.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/28.
//  Copyright © 2020 范摇. All rights reserved.
// 单词树

import Foundation

/// 单词树
class Trie<V> {
    
    var size = 0
    var root: Node<V>? = Node<V>()
    
    public func sized() -> Int { return size }
    func clear() {
        size = 0
    }
    func isEmtpy() -> Bool { return size == 0 }
    
    public func get(_ key: String) -> V? {
        let n = getNode(key)
        return n?.value
    }
    
    
    public func add(_ key: String, _ value: V) -> V? {
        keyCheck(key)
        
        var node = root
        let arr = Array(key)
        for i in 0..<arr.count {
            let c = arr[i]
            var childNode = node?.children[c]
            if childNode == nil {
                childNode = Node<V>()
                node?.children[c] = childNode
            }
            node = childNode
        }
        if node?.word ?? false {//已经存在这个单词
            let oldValue = node?.value
            node?.value = value
            return oldValue
        }
        // 新增一个单词
        node?.word = true
        node?.value = value
        size += 1
        return nil
        
    }
    
    public func remove(_ key: String) -> V? {
        keyCheck(key)
        size -= 1
        return nil
    }
    public func hasWord(_ key: String) -> Bool {
        keyCheck(key)
        
        return false
    }
    
    public func containes(_ key: String) -> Bool {
        let n = getNode(key)
        return n != nil
    }
    
    public func starsWith(_ prefix: String) -> Bool {
        keyCheck(prefix)
        var node = root
        for c in prefix {
            node = node?.children[c]
            if node == nil { return false }
        }
        return true
    }
    
    private func keyCheck(_ key: String) {
        if key.isEmpty {
            // 抛出异常
//            throw
            fatalError("参数不合法")
        }
        
    }
    
    
    private func getNode(_ key: String) -> Node<V>? {
        keyCheck(key)
        var node = root
        for c in key {
            node = node?.children[c]
            if node == nil { return nil }
        }
        
        return node!.word ? node : nil
    }
    

    public class Node<V> {
        
        public var children = Dictionary<Character,Node>()
        public var word = false
        public var value: V?
        
        public init() {
            
        }
    }
}
