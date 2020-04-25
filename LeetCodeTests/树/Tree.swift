//
//  Tree.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/22.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/binary-tree-right-side-view/

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func dfs(_ node: TreeNode, callback: (TreeNode) -> Void ) {
    var stack = Stack<TreeNode>()
    stack.push(node)

    var node = node
    while stack.count != 0 {
        // 做一些事情
        node = stack.pop()
        callback(node)

        if let left = node.left {
            stack.push(left)
        }

        if let right = node.right {
            stack.push(right)
        }
    }
}

func bfs(_ node: TreeNode, callback: (TreeNode) -> Void ) {
    var queue = Queue<TreeNode>()
    queue.inQueue(node)
    
    var node = node
    while !queue.isEmpty() {
        // 做一些事情
        node = queue.deQueue()
        callback(node)
        
        if let left = node.left {
            queue.inQueue(left)
        }
        
        if let right = node.right {
            queue.inQueue(right)
        }
    }
}


func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var result = Array<Int>()
    
    
    var stack = Stack<TreeNode>()
    var deepStack = Stack<Int>()
    stack.push(root)
    var deep = 1
    deepStack.push(deep)
    
    var resultDeep = 0
    var node = root
    while stack.count != 0 {
        // 做一些事情
        node = stack.pop()
        deep = deepStack.pop()
        
        if resultDeep < deep {
            resultDeep = deep
            result.append(node.val)
        }

        if let left = node.left {
            stack.push(left)
            deepStack.push(deep + 1)
        }

        if let right = node.right {
            stack.push(right)
            deepStack.push(deep + 1)
        }
        
    }
    
    return result
}

func rightSideView1(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var result = Array<Int>()
    
    var prevLevelSum = 0
    var levelSum = 0
    
    bfs(root) { (node) in
        prevLevelSum -= 1
        if node.left != nil {
            levelSum += 1
        }
        if node.right != nil {
            levelSum += 1
        }
        if prevLevelSum <= 0 {
            prevLevelSum = levelSum
            levelSum = 0
            result.append(node.val)
        }
    }
    return result
}


import XCTest

extension XCTestCase {
    func testRightSideView() {
        //[1,2,3,null,5,null,4]
        assert(rightSideView(nil) == [])
    }
}
