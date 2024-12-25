//
//  _5398. 统计二叉树中好节点的数目.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/16.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {

    func goodNodes(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
//        if node.left == nil && node.right == nil { return 1 }
        var result = 1
        goodNodes(node, node.val, &result)
        return result
    }
    
    func goodNodes(_ node: TreeNode?, _ maxV: Int, _ result: inout Int) {
        
        if let left = node?.left {
            if left.val >= maxV {
                result += 1
                goodNodes(left, left.val, &result)
            }else {
                goodNodes(left, maxV, &result)
            }
//            print("val_l = \(left.val), res = \(result)")
        }
        
        if let right = node?.right {
            if right.val >= maxV {
                result += 1
                goodNodes(right, right.val, &result)
            }else {
                goodNodes(right, maxV, &result)
            }
            
//            print("val_r = \(right.val), res = \(result)")
        }
    }
}

import XCTest

extension XCTestCase {
    func testGoodNodes() {
        var root = TreeNode.treeNode([3,1,4,3,nil,1,5])
        assert(Solution().goodNodes(root) == 4)
//        root = TreeNode.treeNode([3,3,nil,4,2])
//        assert(Solution().goodNodes(root) == 3)
//        root = TreeNode.treeNode([1])
//        assert(Solution().goodNodes(root) == 1)
    }
}
