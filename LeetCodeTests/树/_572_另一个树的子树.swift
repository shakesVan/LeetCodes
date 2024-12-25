//
//  _572_另一个树的子树.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/7.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/subtree-of-another-tree/

import Foundation

private
class Solution {
    static
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        var q = Queue<TreeNode?>()
        q.inQueue(s)
        while !q.isEmpty() {
            let node = q.deQueue()
            if node == nil { continue }
            if node?.val == t?.val {
                // 对其进行中序遍历，判断是否相等
            }
            if node!.left != nil {
                q.inQueue(node?.left!)
            }
            if node!.right != nil {
                q.inQueue(node?.right!)
            }
        }
        return false
    }
    
    func isSubtree4(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        var q = Queue<TreeNode?>()
        q.inQueue(s)
        while !q.isEmpty() {
            let node = q.deQueue()
            if node == nil { continue }
            if node?.val == t?.val {
                if node?.left == t?.left && node?.right == t?.right {
                    return true
                }
            }
            if node!.left != nil {
                q.inQueue(node?.left!)
            }
            if node!.right != nil {
                q.inQueue(node?.right!)
            }
        }
        return false
    }
        
    func isSubtree3(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard s != nil else { return false }
        if s == t || isSubtree3(s?.left, t) || isSubtree3(s?.right, t) { return true }
        return false
    }
    
    func isSubtree2(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard s != nil else { return false }
        if s == t {
            return true
        }
        if isSubtree2(s?.left, t) {
            return true
        }
        
        if isSubtree2(s?.right, t) {
            return true
        }
        return false
    }
    
    func isSubtree1(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard s != nil else { return false }
        if s == t { return true }
        if isSubtree1(s?.left, t) { return true }
        if isSubtree1(s?.right, t) { return true }
        return false
    }
}

import XCTest

extension XCTestCase {
    func testIsSubtree() {
        var t1 = TreeNode.treeNode([3,4,5,1,2])
        
        var t2 = TreeNode.treeNode([4,1,2])
        
//        assert(Solution.isSubtree(t1, t2) == true)
//
//        t1 = TreeNode.treeNode([3,4,5,1,2,nil,nil,nil,nil,0])
//        assert(Solution.isSubtree(t1, t2) == false)
        
        t1 = TreeNode.treeNode([1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,2])
        t2 = TreeNode.treeNode([1,nil,1,nil,1,nil,1,nil,1,nil,1,2])
        
        assert(Solution.isSubtree(t1, t2) == true)
    }
}
