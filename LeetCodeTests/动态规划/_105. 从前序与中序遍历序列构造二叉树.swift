//
//  _105. 从前序与中序遍历序列构造二叉树.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/22.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else { return nil }
        if preorder.count == 1  { return TreeNode(preorder[0]) }
        var left = 0
        getCount(preorder, inorder, &left)
        let left_1 = left + 1
        let node = TreeNode(preorder[0])
        node.left = buildTree(Array(preorder[1..<left+1]), Array(inorder[0..<left]))
        node.right = buildTree(Array(preorder[left_1..<preorder.count]), Array(inorder[left_1..<preorder.count]))
        return node
    }
    
    
    func getCount(_ preorder: [Int], _ inorder: [Int], _ left: inout Int) {
        guard preorder.count > 0 && inorder.count == preorder.count else { return }
        let rootV = preorder[0]
        var idx = 0
        for item in inorder {
            if item == rootV { break }
            idx += 1
        }
        left = idx
    }
}

import XCTest

extension XCTestCase {
    func testBuildTree() {
        let s = Solution()
        var preorder = [3,9,20,15,7]
        var inorder = [9,3,15,20,7]
        
        var result = TreeNode.treeNode([3,9,20,nil, nil,15,7])
//        assert(s.buildTree(preorder, inorder) == result)
        
        preorder = [1,2]
        inorder = [1,2]
        result = TreeNode.treeNode([1,nil, 2])
        assert(s.buildTree(preorder, inorder) == result)
    }
}
