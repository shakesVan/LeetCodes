//
//  _230_二叉搜索树中的第K小的元素.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/13.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    let list = getValues(root)
    guard k <= list.count, k > 0 else {
        return -1
    }
        
    return list[k-1]
}

func getValues(_ root: TreeNode?) -> [Int] {
    guard let node = root else {
        return []
    }

    var result: [Int] = []
    result.append(contentsOf: getValues(root?.left))
    result.append(node.val)
    result.append(contentsOf: getValues(root?.right))
    
    return result
}
