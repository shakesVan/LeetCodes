//
//  _111_二叉树的最小深度.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/14.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/

import Foundation

private
class Solution {
    
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var ans = 1
        var queue = Queue<TreeNode>()
        queue.inQueue(root)
        var levelCount = 1
        
        while levelCount != 0 {
            let node = queue.deQueue()
            
            if node.left == nil && node.right == nil {
                return ans
            }else {
                if let left = node.left {
                    queue.inQueue(left)
                }
                
                if let right = node.right {
                    queue.inQueue(right)
                }
            }
            
            levelCount -= 1
            // 如果这一层没有遍历完继续遍历
            if levelCount != 0 { continue }
            ans += 1
            // 获取新的一层有多少个元素
            levelCount = queue.sized()
        }
        
        return ans
    }
}

import XCTest

extension XCTestCase {
    func testMinDepth() {
        
        var root = TreeNode.treeNode([3,9,20,nil,nil,15,7])
        assert(Solution().minDepth(root) == 2)
        
        
        root = TreeNode.treeNode([1,2])
        assert(Solution().minDepth(root) == 2)
        
    }
}
