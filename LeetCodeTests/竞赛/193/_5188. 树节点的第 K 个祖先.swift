//
//  _5188. 树节点的第 K 个祖先.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/14.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class TreeAncestor {
    var _parents = [Int: [Int]]()
    var _parentMaps = [Int: [Int: Int]]()
    var _size: Int
    init(_ n: Int, _ parent: [Int]) {
        _size = n
        for key in 0..<parent.count {
            let p = parent[key]
            var ps = _parents[p] ?? []
            
            ps.insert(p, at: 0)
            _parents[key] = ps
            
            for i in 0..<ps.count {
                _parentMaps[key]?[i + 1] = ps[i]
            }
        }
    }
    
    func getKthAncestor(_ node: Int, _ k: Int) -> Int {
        guard k < _size,
            let kp = _parentMaps[node] else { return -1 }
        return kp[k] ?? -1
    }
}

class TreeAncestor1 {
    var _parents = [Int: [Int]]()
    var _size: Int
    init(_ n: Int, _ parent: [Int]) {
        _size = n
        for key in 0..<parent.count {
            let p = parent[key]
            if var ps = _parents[p] {
                ps.insert(p, at: 0)
                _parents[key] = ps
            }else {
                _parents[key] = [p]
            }
        }
    }
    
    func getKthAncestor(_ node: Int, _ k: Int) -> Int {
        guard k < _size,
            let kp = _parents[node],
            k <= kp.count else { return -1 }
        return kp[k - 1]
    }
}
/*
["TreeAncestor","getKthAncestor","getKthAncestor","getKthAncestor","getKthAncestor","getKthAncestor"]
[[5,[-1,0,0,0,3]],[1,5],[3,2],[0,1],[3,1],[3,5]]

[null,-1,-1,-1,0,-1]
 */
/**
 * Your TreeAncestor object will be instantiated and called as such:
 * let obj = TreeAncestor(n, parent)
 * let ret_1: Int = obj.getKthAncestor(node, k)
 */
