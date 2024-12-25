//
//  _101. 对称二叉树.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/31.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return true
    }
   
    var queue1 = [TreeNode]()
    var queue2 = [TreeNode]()
    queue1.append(root)
    queue2.append(root)
    while !queue1.isEmpty || !queue2.isEmpty {
        let node1 = queue1.removeFirst()
        let node2 = queue2.removeFirst()
        
        if node1.val != node2.val {
            return false
        }
        
        if let left = node1.left {
            queue1.append(left)
        }
        if let right = node2.right {
            queue2.append(right)
        }
        // 如果以上两条只执行了一条，则数组长度不一致，返回false
        if queue1.count != queue2.count {
            return false
        }
        
        if let right = node1.right {
            queue1.append(right)
        }
        if let left = node2.left {
            queue2.append(left)
        }
        // 如果以上两条只执行了一条，则数组长度不一致，返回false
        if queue1.count != queue2.count {
            return false
        }
    }
    return true
}



private
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        var queue = Queue<TreeNode?>()
        queue.inQueue(root)
        queue.inQueue(root)
        
        while queue.isEmpty() {
            let n1 = queue.deQueue()
            let n2 = queue.deQueue()
            
            if n1 == nil && n2 == nil {continue}
            if n1 == nil && n2 != nil { return false }
            if n2 == nil && n1 != nil { return false }
            if n1!.val != n2!.val { return false }
            queue.inQueue(n1?.left)
            queue.inQueue(n2?.right)
            
            queue.inQueue(n1?.right)
            queue.inQueue(n2?.left)
            
        }
        return true
    }
    
}
