//
//  _94_二叉树的中序遍历.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/10.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    return inorderTraversal(root)
    
}

func inorderTraversal(_ root: TreeNode) -> [Int] {
    
    var result = [Int]()
    
    if let left = root.left {
        result.append(contentsOf: inorderTraversal(left))
    }
    result.append(root.val)
    if let right = root.right {
        result.append(contentsOf: inorderTraversal(right))
    }
    return result
}
