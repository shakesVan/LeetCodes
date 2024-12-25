//
//  _98_验证二叉搜索树.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/5.
//  Copyright © 2020 范摇. All rights reserved.
//  https://leetcode-cn.com/problems/validate-binary-search-tree/

import Foundation

private
func isValidBST(_ root: TreeNode?) -> Bool {
    var stack = Array<TreeNode>()
    var inOrder = Int.min
    var node = root
    while !stack.isEmpty || node != nil {
        while node != nil {
            stack.append(node!)
            node = node?.left
        }
        node = stack.removeLast()
        if node!.val <= inOrder {
            return false
        }
        inOrder = node!.val
        node = node?.right
    }
    return true
}

// 失败
func isValidBST1_e(_ root: TreeNode?) -> Bool {
    guard var node = root else { return true }
    
    var maxV = Int.min
//    var flag = true

    var stack = Array<TreeNode>()
    var map: Dictionary<Int, Bool> = [:]
    stack.append(node)
    
    while stack.count != 0 {
        
        node = stack.removeLast()

        if map[node.val] != nil { continue }
        
        if let right = node.right {
            stack.append(right)
        }
        
        
        if let left = node.left, map[left.val] == nil {
            stack.append(node)
            stack.append(left)
        }else {
            
            map[node.val] = true
            if node.val > maxV {
                maxV = node.val
            }else {
                return false
            }
        }
    }
    
    return true
}

func isValidBST1(_ root: TreeNode?) -> Bool {
    guard let node = root else {
        return true
    }
    
    var oldV = Int.min
    var flag = true
    validDfs(node) { (node) in
        print("\(node.val) ")
        if node.val <= oldV {
            flag = false
            return
        }
        oldV = node.val
    }
    return flag
}


private
func validDfs(_ node: TreeNode, callback: (TreeNode) -> Void ) {
    var stack = Stack<TreeNode>()
    var map: Dictionary<TreeNode, Bool> = [:]
    stack.push(node)
    map[node] = true
    
    var node = node
    while stack.count != 0 {
        // 做一些事情
        node = stack.pop()
        
        if let right = node.right {
            map[right] = true
            stack.push(right)
        }
        
        if map[node] == nil, let left = node.left, map[left] == nil {
            
            map[node] = true
            map[left] = true
            stack.push(node)
            stack.push(left)
        }else {
            //            if map[node] == nil {
            callback(node)
            //            }
        }
    }
}

import XCTest

extension XCTestCase {
    func testIsValidBST() {
        let n1 = TreeNode(2)
        
        let n2 = TreeNode(2)
        n2.left = TreeNode(1)
        n2.right = TreeNode(3)
        
        
        let n3 = TreeNode(2)
        n3.left = TreeNode(3)
        n3.right = TreeNode(1)
        
        
        let n4 = TreeNode(2)
        n4.left = TreeNode(2)
        assert(isValidBST(n1) == true)
        assert(isValidBST(n2) == true)
        assert(isValidBST(n3) == false)
        assert(isValidBST(n4) == false)
    }
    
    
}

