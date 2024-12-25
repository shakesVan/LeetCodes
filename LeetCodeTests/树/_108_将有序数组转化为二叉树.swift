//
//  _108_将有序数组转化为二叉树.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/12.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    // 数组拆为3部分，中， 左子树，右子树
    
    // count == 1，则只有中，count == 0 为nil， 拆封逻辑为：
    // mid = nums.count / 2 为中节点
    // 0..<mid 为左子树
    // mid+1..<nums.count 为右节点
    if nums.count == 0 {
        return nil
    }
    
    if nums.count == 1 {
        return TreeNode.init(nums[0])
    }
    
    let mid = nums.count / 2
    let root = TreeNode.init(nums[mid])
    root.left = sortedArrayToBST(Array(nums[0..<mid]))
    
    if mid + 1 < nums.count {
        root.right = sortedArrayToBST(Array(nums[(mid+1)..<nums.count]))
    }
    
    return root
}



import XCTest

class SortedArrayToBSTTestCase: XCTestCase {
    func testSortedArrayToBST() {
        
        let treeNode1 = sortedArrayToBST([-10, -3, 0, 5, 9])
        
//        let treeNode1 = sortedArrayToBST([0, -3, -10, 9, 5])
        
        assert(treeNode1 != nil)
        bfs(treeNode1!) { node in
            print(node.describing)
        }
        
        print("========")
        dfs(treeNode1!) { node in
            print(node.describing)
        }

        print("111")
    }
    
}


