//
//  _面试题24_反转链表.swift
// 206. 反转链表
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/15.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/
// https://leetcode-cn.com/problems/reverse-linked-list/

import Foundation

func reverseList(_ head: ListNode?) -> ListNode? {

    var node = head
    var newNode: ListNode? = nil
    while node != nil {
        guard let val = node?.val else {
            break
        }
        let tmp = ListNode(val)
        tmp.next = newNode
        newNode = tmp
        node = node?.next
        
    }
    return newNode
}

import XCTest

extension XCTestCase {
    
    func testReverseList() {
        let a1 = [7,2,4,3]
        let a0 = [Int]()
        
        let node0 = ListNode.listNode(a0)
        assert(reversedListNode(node0) == nil)
        let node1 = ListNode.listNode(a1)
        assert(reversedListNode(node1)!.description == "[3,4,2,7]")
    }
}
