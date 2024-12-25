//
//  _113_路径总和2.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/13.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate var result: [[Int]] = []
fileprivate var path: [Int] = []

fileprivate
func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    dfs(root, targetSum)
    
    return result
}

fileprivate
func dfs(_ root: TreeNode?, _ targetSum: Int) {
    guard let root = root else {
        return
    }
    
    path.append(root.val)
    let targetSum = targetSum - root.val
    if root.left == nil && root.right == nil && targetSum == 0 {
        print("path = \(path)")
        result.append(path)
    }
    dfs(root.left, targetSum)
    dfs(root.right, targetSum)
    let _ = path.popLast()
}

func pathSum1(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    var result: [[Int]] = []
    let arrayList = getLongPath(root)
    
    for i in 0..<arrayList.count {
        var sum = 0
        for j in 0..<arrayList[i].count {
            sum += arrayList[i][j]
        }
        if sum == targetSum {
            result.append(arrayList[i])
        }
    }
    
    return result
}

fileprivate
func getLongPath(_ root: TreeNode?) -> [[Int]] {
    
    guard let root = root else {
        return []
    }
    if root.left == nil && root.right == nil {
        print("getLongPath result = [[\(root.val)]]")
        return [[root.val]]
    }
    
    var result: [[Int]] = []
    
    var leftPaths = getLongPath(root.left)
    for i in 0..<leftPaths.count {
        leftPaths[i].insert(root.val, at: 0)
        result.append(leftPaths[i])
    }
    
    var rightPaths = getLongPath(root.right)
    for i in 0..<rightPaths.count {
        rightPaths[i].insert(root.val, at: 0)
        result.append(rightPaths[i])
    }
    print("getLongPath result = \(result)")
    return result
}
