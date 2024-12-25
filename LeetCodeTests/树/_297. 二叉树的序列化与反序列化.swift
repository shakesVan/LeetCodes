//
//  297. 二叉树的序列化与反序列化.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/16.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        let arr = getArr(root)
        return arrayToStr(arr)
    }
    
    func getArr(_ root: TreeNode?) -> Array<Int?> {
        var ans = [Int?]()
        var queue = Queue<TreeNode?>()
        queue.inQueue(root)
        while !queue.isEmpty() {
            let node = queue.deQueue()
            ans.append(node?.val)
            if node == nil { continue }
            queue.inQueue(node?.left)
            queue.inQueue(node?.right)
        }
        return ans
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let arr = strToArray(data)
        let node = Codec.treeNode(arr)
        return node
    }
    
    func strToArray(_ data: String) -> [Int?] {
        var data = data
        data.removeLast()
        data.removeFirst()
        let ans = data.split(separator: ",").map { Int($0) }
        return ans
    }
    
    func arrayToStr(_  arr: [Int?]) -> String {
        guard arr.count > 0 else { return "[]" }
        var ans = "["
        // 减少判断次数
        ans += (arr[0] != nil ? "\(arr[0]!)" : "nil")
        for i in 1..<arr.count {
            ans += (arr[i] != nil ? ",\(arr[i]!)" : ",nil")
        }
        ans += "]"
        return ans
    }
    
    public static func treeNode(_ vals: [Int?]) -> TreeNode? {
        guard vals.count > 0, vals.first != nil else { return nil }
        let nodes = vals.map { $0 != nil ? TreeNode($0!) : nil }
        var offset = 0
        for i in (1..<nodes.count).reversed() {
            let node = nodes[i]
            var parent = nodes[(i - 1) >> 1]
            while parent == nil {
                offset += 1
                parent = nodes[(i - 1 + offset) >> 1]
            }
            offset = 0
            if i & 1 == 1 {
                parent?.left = node
            }else {
                parent?.right = node
            }
        }
        return nodes[0]
    }
}

import XCTest

extension XCTestCase {
    func testCodec() {
        let codec = Codec()
        var rootA: [Int?] = [5,2,3,nil,nil,2,4,3,1]
        var rootS = "[5,2,3,nil,nil,2,4,3,1]"
        var root = Codec.treeNode(rootA)
        let ser = codec.serialize(root)
        var ans = codec.deserialize(ser)
        assert(ans == root)
    }
}
// Your Codec object will be instantiated and called as such:
// var codec = Codec()
// codec.deserialize(codec.serialize(root))
