//
//  _114_二叉树展开为链表.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/13.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func flatten(_ root: TreeNode?) {
    var list: [TreeNode?] = getTreeNodes(root)
    
    for i in 0..<list.count {
        print("list\(i) = \(list[i]?.val ?? -1)")
        if i < list.count - 1 {
            list[i]?.left = nil
            list[i]?.right = list[i+1]
        }
    }
}

func getTreeNodes(_ root: TreeNode?) -> [TreeNode?] {
    guard let node = root else {
        return []
    }

    var result: [TreeNode?] = []
    result.append(node)
    result.append(contentsOf: getTreeNodes(node.left))
    result.append(contentsOf: getTreeNodes(node.right))

    return result
}
