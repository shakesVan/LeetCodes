//
//  _637_二叉树的层平均值.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/14.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/average-of-levels-in-binary-tree/

import Foundation
private
class Solution {
    // 迭代
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var ans = [Double]()
        var queue = Queue<TreeNode>()
        queue.inQueue(root)
        var levelCount = 1
        
        var levelAns = [Int]()
        while levelCount != 0 {
            let node = queue.deQueue()
            
            if let left = node.left {
                queue.inQueue(left)
            }
            
            if let right = node.right {
                queue.inQueue(right)
            }
            
            levelAns.append(node.val)
            levelCount -= 1
            // 如果这一层没有遍历完继续遍历
            if levelCount != 0 { continue }
            ans.append(Double(levelAns.reduce(0, { $0 + $1 })) / Double(levelAns.count))
            
            levelAns = []
            // 获取新的一层有多少个元素
            levelCount = queue.sized()
        }
        
        return ans
    }
}
