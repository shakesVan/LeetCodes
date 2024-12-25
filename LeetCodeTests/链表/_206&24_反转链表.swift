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
    var root = ListNode(0)
    root.next = head
    
    var curr: ListNode? = head
    var next = curr?.next
    while (next != nil) {
        curr?.next = next?.next
        next?.next = root.next
        root.next = next
        
        next = curr?.next
    }

//    print(curr?.description)
    return root.next
}


func reverseList3(_ head: ListNode?) -> ListNode? {
    var prev = head;
    var curr: ListNode? = head;
    var next: ListNode? = nil;
    while (curr?.next != nil) {
        next = curr?.next
        curr?.next = prev
        prev?.next = next
        prev = curr
        curr = next
    }

    print(curr?.description)
    print(prev?.description)
    return prev
}

func reverseList2(_ head: ListNode?) -> ListNode? {

    var node = head
    var newNode: ListNode? = nil
    while node != nil {
        let tmp = ListNode(node!.val)
        tmp.next = newNode
        newNode = tmp
        node = node?.next
    }
    return newNode
}

func reverseList1(_ head: ListNode?) -> ListNode? {

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
        
//        let node0 = ListNode.listNode(a0)
//        assert(reversedListNode(node0) == nil)
        let node1 = ListNode.listNode(a1)
        assert(reverseList(node1)!.description == "[3,4,2,7]")
    }
}
