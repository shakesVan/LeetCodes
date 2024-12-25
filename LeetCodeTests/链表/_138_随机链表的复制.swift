//
//  _138_随机链表的复制.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/12.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


fileprivate class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

extension Node {
    var getHashString: String {
        "\(Unmanaged.passUnretained(self).toOpaque())"
    }
}

fileprivate
func copyRandomList(_ head: Node?) -> Node? {

    // 链表转为数组
    // 链表节点数组
    var nodeArray: [Node] = []

    // 链表所在位置映射，key为nodehash值，value为对应数组中的下标
    var map: [String: Int] = [:]
    
    var tmp = head
    var index = 0
    while let old = tmp {
        
        let new = Node(old.val)
        nodeArray.append(new)
        map[old.getHashString] = index
    
        tmp = tmp?.next
        index += 1
    }
    
    
    var randomIndexArray: [Int?] = []
    tmp = head
    while let old = tmp {
        if let random = old.random {
            randomIndexArray.append(map[random.getHashString])
        } else {
            randomIndexArray.append(nil)
        }
        tmp = tmp?.next
    }
     
    // 新建链表
    guard randomIndexArray.count == nodeArray.count else {
        print("数据异常")
        return nil
    }
    for i in 0..<nodeArray.count {
        let node = nodeArray[i]
        let randomIndex = randomIndexArray[i]
        
        // 设置next指针
        if i < nodeArray.count - 1 {
            node.next = nodeArray[i+1]
        }
        
        // 设置随机指针
        if let index = randomIndex {
            node.random = nodeArray[index]
        }
    }
    
    return nodeArray.first ?? nil
}
