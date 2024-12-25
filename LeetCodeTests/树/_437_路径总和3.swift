//
//  _437_路径总和3.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/13.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate var result: Int = 0

func pathSum2(_ root: TreeNode?, _ targetSum: Int) -> Int {
    guard let root = root else {
        return result
    }
    dfs(root, targetSum)
    
    let _ = pathSum2(root.left, targetSum)
    let _ = pathSum2(root.right, targetSum)
    
    return result
}

fileprivate
func dfs(_ root: TreeNode?, _ targetSum: Int) {
    guard let root = root else {
        return
    }
    let newTargetSum = targetSum - root.val
    print("root.val = \(root.val), targetSum = \(targetSum) , newTargetSum = \(newTargetSum)")
    if newTargetSum == 0 {
        print("result root.val = \(root.val), newTargetSum = \(newTargetSum)")
        result += 1
    }
    
    dfs(root.left, newTargetSum)
    dfs(root.right, newTargetSum)
}
