//
//  _236_二叉树的最近公共祖先.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/10.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/

import Foundation

private
class Solution {
    static
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard var node = root else { return nil }
        var stack = Array<TreeNode>()
        var a_p = Array<TreeNode>()
        var a_q = Array<TreeNode>()
        
        stack.append(node)
        var flagp = false
        var flagq = false
        while stack.count != 0 {
            // 做一些事情
            node = stack.removeLast()
            if !flagp {
                a_p.append(node)
            }
            if !flagq {
                a_q.append(node)
            }
            if node.val == p?.val {
                if flagq { break }
                flagp = true
            }
            if node.val == q?.val {
                if flagp { break }
                flagq = true
            }
            
            if let right = node.right {
                stack.append(right)
            }
            
            if let left = node.left {
                stack.append(left)
            }
        }
        
        print("a_p == \(a_p.description)")
        print("a_q == \(a_q.description)")
        var idx = 0
        while idx < a_p.count && idx < a_q.count {
            if a_p[idx].val != a_q[idx].val {
                return a_p[idx-1]
            }
            idx += 1
        }
        return nil
    }
}

import XCTest

extension XCTestCase {
    func testLowestCommonAncestor() {
        var root: TreeNode?
        var p: TreeNode?
        var q: TreeNode?
        
        root = TreeNode.treeNode([3,5,1,6,2,0,8,nil,nil,7,4])
        p = TreeNode(5)
        q = TreeNode(1)
        assert(Solution.lowestCommonAncestor(root, p , q)?.val == 3)
        
        q = TreeNode(4)
        assert(Solution.lowestCommonAncestor(root, p , q)?.val == 5)
        
    }
}
