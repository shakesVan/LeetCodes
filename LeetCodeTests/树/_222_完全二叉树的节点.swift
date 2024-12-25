//
//  _222_完全二叉树的节点.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func countNodes(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    var result = 1
    result += countNodes(root?.left)
    result += countNodes(root?.right)
    return result
}

import XCTest

class CountNodesCase: XCTestCase {
    func testCountNodes() {
        assert(countNodes(TreeNode.treeNode([1,2,3,4,5,6])) == 6)
        assert(countNodes(TreeNode.treeNode([1,2,3,4,5])) == 5)
    }
}
