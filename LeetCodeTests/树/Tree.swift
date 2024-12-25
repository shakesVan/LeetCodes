//
//  Tree.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/22.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/binary-tree-right-side-view/

import Foundation


/// 二叉树
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public convenience init?(_ val: Int?) {
        guard let val = val else {  return nil }
        self.init(val)
    }
    
    public static func treeNode(_ vals: [Int?]) -> TreeNode? {
        guard vals.count > 0, vals.first != nil else { return nil }
        let nodes = vals.map { TreeNode($0) }
        for i in (1..<nodes.count).reversed() {
            let node = nodes[i]
            let parent = nodes[(i - 1) >> 1]
            if i & 1 == 1 {
                parent?.left = node
            }else {
                parent?.right = node
            }
            
        }
        return nodes[0]
    }
    
    var describing: String {
        var leftStr = "nil"
        if left != nil {
            leftStr = String(left!.val)
        }
        var rightStr = "nil"
        if right != nil {
            rightStr = String(right!.val)
        }
        return "\(val)_\(leftStr)L_\(rightStr)R"
    }
}

extension TreeNode: Hashable,Equatable {
    
    public var hashValue: Int {
        return val
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(left)
        hasher.combine(right)
    }
    
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        // 效率过低
        return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }
    
}

extension Optional where Wrapped: Equatable {
    public static func isEqual(lhs: Wrapped?, rhs: Wrapped?) -> Bool {
        switch (lhs,rhs) {
        case (nil,nil):
            return true
        case (nil,_),(_, nil):
            return false
        default:
            return lhs! == rhs!
        }
    }
    
}

// 深度遍历
public
func dfs(_ node: TreeNode, callback: (TreeNode) -> Void) {
    var stack = Stack<TreeNode>()
    stack.push(node)

    var node = node
    while stack.count != 0 {
        // 做一些事情
        node = stack.pop()
        callback(node)
        
        if let right = node.right {
            stack.push(right)
        }
        
        if let left = node.left {
            stack.push(left)
        }

    }
}

// 广度遍地
public
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


import XCTest

class TreeNodeTestCase: XCTestCase {
    
    func testTreeNode() {
        
        let tn = TreeNode.treeNode([5,1,4,nil,nil,3,6])
//        bfs(tn!) { (node) in
//            print(node.describing + " ")
//        }
        
        dfs(tn!) { (node) in
            print(node.describing + " ")
        }
        
    }
    
    func testForEach() {
        print("1--- \(Date())")
        var value = [Int]()
        for i in 0..<1000000 {
            value.append(Int(arc4random()%100000) + i)
        }
        
        print("2--- \(Date())")
        value.sort()
//        print(value)
        print("3--- \(Date())")
        value.sort(by: >)
        print("4--- \(Date())")
    }
    
}
