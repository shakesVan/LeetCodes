//
//  _104_二叉树的最大深度.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/10.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
    return levelOrder(root).count
}

private
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {
        return []
    }
    
    var result = [[Int]]()
    
    var queue = [TreeNode]()
    queue.append(root)
    while !queue.isEmpty {
        var tmp = [TreeNode]()
        var levelResult = [Int]()
        for node in queue {
            if let left = node.left {
                tmp.append(left)
            }
            
            if let right = node.right {
                tmp.append(right)
            }
            levelResult.append(node.val)
        }
        
        result.append(levelResult)
        queue = tmp
    }
    
    return result
}
