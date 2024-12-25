//
//  二叉树的右视图.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/5.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation


fileprivate
func rightSideView(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    var nodes = [root]
    var result = [Int]()
    
    while nodes.count > 0 {
        var tmp = nodes.last??.val ?? 0
        
        result.append(tmp)
        nodes = getSubLevelNodes(nodes)
    }
    return result
}

fileprivate
func getSubLevelNodes(_ nodes: [TreeNode?]) -> [TreeNode?] {
    var result: [TreeNode?] = []
    
    for node in nodes {
        if let left = node?.left {
            result.append(left)
        }
        
        if let right = node?.right {
            result.append(right)
        }
    }
    return result
}


func rightSideView1(_ root: TreeNode?) -> [Int] {
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

import XCTest

class RightSideViewCase: XCTestCase {
    func testRightSideView() {
        //[1,2,3,null,5,null,4]
        assert(rightSideView(TreeNode.treeNode([1,2,3,nil,5,nil,4])) == [1,3,4])
    }
}
