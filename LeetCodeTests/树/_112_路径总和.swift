//
//  _112_路径总和.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/13.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    
    guard let node = root else {
        return false
    }
    var targetSum = targetSum - node.val
//    print("val = \(node.val)_\(node.left)L_\(node.right), targetSum = \(targetSum)")
    if node.left == nil && node.right == nil {
        return targetSum == 0
    }
    
    if let left = node.left,
       hasPathSum(left, targetSum) {
        return true
    }
    if let right = node.right,
       hasPathSum(right, targetSum) {
        return true
    }
    return false
}
