//
//  _103_二叉树的锯齿形层序遍历.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/22.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    var nodes = [root]
    var flag = false
    var result = [[Int]]()
    
    while nodes.count > 0 {
        var tmp = nodes.map { $0?.val ?? 0 }
        if flag {
            tmp = tmp.reversed()
        }
        result.append(tmp)
        nodes = getSubLevelNodes(nodes)
        flag = !flag
    }
    return result
}

fileprivate
func getSubLevelNodes(_ nodes: [TreeNode?]) -> [TreeNode?] {
    var result: [TreeNode?] = []
    
    for node in nodes {
        if let left = node?.left {
            result.append(left)
        }
        
        if let right = node?.right {
            result.append(right)
        }
    }
    return result
}

import XCTest

class ZigzagLevelOrderCase: XCTestCase {
    func testZigzagLevelOrder() {
        
        assert(zigzagLevelOrder(TreeNode.treeNode([3,9,20,nil,nil,15,7])) == [[3],[20,9],[15,7]])
        
        assert(zigzagLevelOrder(TreeNode.treeNode([1])) == [[1]])
        assert(zigzagLevelOrder(TreeNode.treeNode([])) == [])
    }
}
