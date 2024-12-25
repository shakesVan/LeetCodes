//
//  _5418. 二叉树中的伪回文路径.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/24.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/pseudo-palindromic-paths-in-a-binary-tree/

import Foundation

private
class Solution {
    func pseudoPalindromicPaths(_ root: TreeNode?) -> Int {
        
        guard let root = root else { return 0 }
        
        var tmp: Dictionary<Int, Bool> = [:]
        var result = 0
        var stack = Stack<TreeNode>()
        stack.push(root)
        if tmp[root.val] == nil {
            tmp[root.val] = true
        }else {
            tmp[root.val] = nil
        }
        
        while !stack.isEmpty {
            let node = stack.pop()
            print("\(node.val)_L\(node.left?.val)_R\(node.right?.val)")
            
            if tmp[node.val] == nil {
                tmp[node.val] = true
            }else {
                tmp[node.val] = nil
            }
            if let left = node.left {
                stack.push(left)
                // 重制node
                if tmp[left.val] == nil {
                    tmp[left.val] = true
                }else {
                    tmp[left.val] = nil
                }
            }else if node.right == nil {
                // 是叶子结点
                if tmp.count <= 1 {
                    result += 1
                }
                // 重制node
                if tmp[node.val] == nil {
                    tmp[node.val] = true
                }else {
                    tmp[node.val] = nil
                }
                continue
            }

            if let right = node.right {
                stack.push(right)
                // 重制node
                if tmp[right.val] == nil {
                    tmp[right.val] = true
                }else {
                    tmp[right.val] = nil
                }
            }
        }
        
        return result
    }
    
    func pseudoPalindromicPaths1(_ root: TreeNode?) -> Int {
        
        guard let root = root else { return 0 }
        // 保存子节点的父节点
        // [当前节点地址, 父节点地址]
        var parents: [Int: TreeNode] = [:]

        var leafs = [TreeNode?]()
        var queue = Queue<TreeNode>()
        queue.inQueue(root)

        while !queue.isEmpty() {
            let node = queue.deQueue()
            
            if let left = node.left {
                queue.inQueue(left)
                parents[getUnsafePoint(left)] = node
            }else if node.right == nil {
                leafs.append(node)
                continue
            }

            if let right = node.right {
                queue.inQueue(right)
                parents[getUnsafePoint(right)] = node
            }
        }
        var result = 0
        
        var tmp: Dictionary<Int, Bool>
        for i in 0..<leafs.count {
            tmp = Dictionary<Int, Bool>()
            var leaf: TreeNode? = leafs[i]
            while leaf != nil {
                if tmp[leaf!.val] == nil {
                    tmp[leaf!.val] = true
                }else {
                    tmp[leaf!.val] = nil
                }
                leaf = parents[getUnsafePoint(leaf!)]
            }
            if tmp.count <= 1 {
                result += 1
            }
        }
        return result
    }
    
    
    func getUnsafePoint<T>(_ type: T) -> Int {
        return unsafeBitCast(type, to: Int.self)
    }
}


import XCTest

extension XCTestCase {
    func testPseudoPalindromicPaths() {
        
        
        let s = Solution()
        var root = TreeNode.treeNode([2,3,1,3,1,nil,1])
        
        assert(s.pseudoPalindromicPaths(root) == 2)

        root = TreeNode.treeNode([2,1,1,1,3,nil,nil,nil,nil,nil,1])
        assert(s.pseudoPalindromicPaths(root) == 1)

        root = TreeNode.treeNode([9])
        assert(s.pseudoPalindromicPaths(root) == 1)

        root = TreeNode.treeNode([1,9,1,nil,1,nil,1,nil,nil,7,nil,nil,4])
        assert(s.pseudoPalindromicPaths(root) == 1)
    }
}

