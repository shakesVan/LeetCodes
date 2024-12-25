//
//  _226_翻转二叉树.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/10.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


func invertTree(_ root: TreeNode?) -> TreeNode? {
    var root = root
    invertTree(in: &root)
    return root
    
}

func invertTree(in root: inout TreeNode?) {
    guard let root = root else {
        return
    }
    invertTree(in: &(root.left))
    invertTree(in: &(root.right))
    (root.left, root.right) = (root.right, root.left)
}
