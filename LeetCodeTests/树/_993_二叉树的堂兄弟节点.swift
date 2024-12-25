//
//  _993_二叉树的堂兄弟节点.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/14.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/cousins-in-binary-tree/

import Foundation

private
class Solution {
    struct MyTreeNode {
        var treeNode: TreeNode
        var parentVal: Int?
        
        init(_ treeNode: TreeNode, _ parentVal: Int? = nil) {
            self.treeNode = treeNode
            self.parentVal = parentVal
        }
    }
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else { return false }
        var queue = Queue<MyTreeNode>()
        queue.inQueue(MyTreeNode(root))
        var levelCount = 1
        
        var levelAns = [Int: Int?]()
        while levelCount != 0 {
            let node = queue.deQueue()
            
            if let left = node.treeNode.left {
                queue.inQueue(MyTreeNode(left, node.treeNode.val))
            }
            
            if let right = node.treeNode.right {
                queue.inQueue(MyTreeNode(right, node.treeNode.val))
            }
            
            levelAns[node.treeNode.val] = node.parentVal
            levelCount -= 1
            // 如果这一层没有遍历完继续遍历
            if levelCount != 0 { continue }
            let x_v = levelAns[x]
            let y_v = levelAns[y]
            if x_v != nil || y_v != nil {
                if x_v != nil && y_v != nil { return x_v != y_v }
                return false
            }
            levelAns = [:]
            // 获取新的一层有多少个元素
            levelCount = queue.sized()
        }
        
        return false
    }
}

import XCTest

extension XCTestCase {
    func testIsCousins() {
        var root = TreeNode.treeNode([1,2,3,nil,4,nil,5])
        var x = 5
        var y = 4
//        assert(Solution().isCousins(root, x, y))
        
        root = TreeNode.treeNode([1,2,3,nil,4])
        x = 2
        y = 3
        assert(!Solution().isCousins(root, x, y))


        root = TreeNode.treeNode([1,2,3,4])
        x = 4
        y = 3
        assert(!Solution().isCousins(root, x, y))
    }
}
