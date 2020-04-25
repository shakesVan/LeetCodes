//
//  UnionFind.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/20.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
/// 并查集协议
public protocol UnionFind {
    associatedtype V
    // 总共有多少个集合
    func sized() -> Int
    // 找出一个值所在的集合
    func find(_ v: V) -> V?
    // 合并两个值所在的集合
    func union(_ v1: V, _ v2: V)
    // 判断两个值是否在一个集合
    func isSame(_ v1: V, _ v2: V) -> Bool
}

/// 通用并查集
public class GeneralUniFind<V: Hashable>: UnionFind {
    
    public func sized() -> Int {
        return size
    }
    
    public func makeSet(_ v: V) {
        if nodes[v] != nil { return }
        nodes[v] = Node(v)
        size += 1
    }
    public func find(_ v: V) -> V? {
        return findNode(v)?.value
    }
    
    /// rank优化，合并
    public func union(_ v1: V, _ v2: V) {
        if isSame(v1, v2) { return }
        guard let p1 = findNode(v1),
            let p2 = findNode(v2) else { return }
        
        if p1.rank > p2.rank {
            p2.parent = p1
        }else if p1.rank < p2.rank {
            p1.parent = p2
        }else {
            p1.parent = p2
            p2.rank += 1
        }
        size -= 1
        return
    }
    
    // 是否处于同一并查集
    public func isSame(_ v1: V, _ v2: V) -> Bool {
        return find(v1) == find(v2)
    }
    
    private var size: Int = 0
    private var nodes: Dictionary<V, Node> = [:]
    
    /// 找出根节点，路径减半
    private func findNode(_ v: V) -> Node? {
        guard var node = nodes[v] else { return nil }
        // 减少rank
        while node.value != node.parent.value {
            node.parent = node.parent.parent
            node = node.parent
        }
        return node
    }
    
    private class Node {
        var value: V
        var rank = 1
        lazy var parent: Node = { [unowned self] in
            return self
        }()
        
        init(_ v: V) {
            value = v
        }
    }
}

import XCTest

extension XCTestCase {
    func testGeneralUniFind() {
        
        let guf = GeneralUniFind<Int>()
        guf.makeSet(0)
        guf.makeSet(1)
        guf.makeSet(2)
        guf.makeSet(3)
        
        guf.union(0, 1)
        guf.union(2, 3)
        
        
        assert(guf.find(0) == 1)
        assert(guf.find(1) == 1)
        
        assert(guf.isSame(0, 1) == true)
        assert(guf.isSame(2, 3) == true)
        
        assert(guf.isSame(1, 2) == false)
        guf.union(1, 2)
        
        assert(guf.isSame(0, 3) == true)
        
    }
}


