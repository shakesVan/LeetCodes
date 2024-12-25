//
//  _102_二叉树的层序遍历.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/13.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/binary-tree-level-order-traversal/

import Foundation

private
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {
        return []
    }
    
    var result = [[Int]]()
    
    var queue = [TreeNode]()
    queue.append(root)
    while !queue.isEmpty {
        var tmp = [TreeNode]()
        var levelResult = [Int]()
        for node in queue {
            if let left = node.left {
                tmp.append(left)
            }
            
            if let right = node.right {
                tmp.append(right)
            }
            levelResult.append(node.val)
        }
        
        result.append(levelResult)
        queue = tmp
    }
    
    return result
}



private
class Solution {
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
    // 递归
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }
        levelOrder(node, 0)
        return result
    }
    // 迭代
    func levelOrder2(_ root: TreeNode?) -> [[Int]] {
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
        
        return ans
    }
    
    func levelOrder1(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans = [[Int]()]
        var queue = Queue<TreeNode>()
        queue.inQueue(root)
        var levelCount = 1
        
        while !queue.isEmpty() {
            let node = queue.deQueue()
            
            if let left = node.left {
                queue.inQueue(left)
            }
            
            if let right = node.right {
                queue.inQueue(right)
            }

            ans[ans.count - 1].append(node.val)
            levelCount -= 1
            if levelCount == 0 {
                // 获取新的一层有多少个
                levelCount = queue.sized()
                // 下一层没有东西了，就不需要再添加了
                if levelCount != 0 {
                    ans.append([Int]())
                }
            }
        }
        
        return ans
    }
}

import XCTest

extension XCTestCase {
    func testLevelOrder() {
        let s = Solution()
        var root = TreeNode.treeNode([3,9,20,nil,nil,15,7])
        assert(s.levelOrder(root) == [
            [3],
            [9,20],
            [15,7]
            ])
        root = nil
        assert(s.levelOrder(root) == [])
    }
}
