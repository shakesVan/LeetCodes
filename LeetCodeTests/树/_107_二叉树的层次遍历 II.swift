//
//  _107_二叉树的层次遍历 II.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/14.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/

import Foundation

private
class Solution {
    // 其他方法同102
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }
        levelOrder(node, 0)
        return result.reversed()
    }

    var result = [[Int]]()
    func levelOrder(_ node: TreeNode, _ level: Int) {
        if result.count == level {
            result.append([node.val])
        }else {
            result[level].append(node.val)
        }
        
        if let left = node.left {
            levelOrder(left, level + 1)
        }
        
        if let right = node.right {
            levelOrder(right, level + 1)
        }
        
    }
    
    // 迭代
    func levelOrderBottom2(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans = [[Int]]()
        var queue = Queue<TreeNode>()
        queue.inQueue(root)
        var levelCount = 1
        
        var levelAns = [Int]()
        while levelCount != 0 {
            let node = queue.deQueue()
            
            if let left = node.left {
                queue.inQueue(left)
            }
            
            if let right = node.right {
                queue.inQueue(right)
            }
            
            levelAns.append(node.val)
            levelCount -= 1
            // 如果这一层没有遍历完继续遍历
            if levelCount != 0 { continue }
            ans.append(levelAns)
            levelAns = []
            // 获取新的一层有多少个元素
            levelCount = queue.sized()
        }
        
        return ans.reversed()
    }
    
}
