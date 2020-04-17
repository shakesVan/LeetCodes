//
//  _445_两数之和2.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/14.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/add-two-numbers-ii/

import Foundation

func reversedListNode(_ l1: ListNode?) -> ListNode? {

    var node = l1
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

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    let l11 = reversedListNode(l1)
    let l22 = reversedListNode(l2)
    
    let l3 = addTwoNumbers1(l11,l22)
    
    return reversedListNode(l3)
    
}

func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var node: ListNode?
    
    var root = node
    var v_l1 = l1
    var v_l2 = l2
    
    var carry = 0
    while v_l1 != nil || v_l2 != nil || carry != 0 {
        var item = (v_l1?.val ?? 0) + (v_l2?.val ?? 0) + carry
        if item > 9 {
            item -= 10
            carry = 1
        }else {
            carry = 0
        }
        
        let next = ListNode(item)
        if node == nil {
            node = next
            root = node
        }else {
            node?.next = next
            node = node?.next
        }
        v_l1 = v_l1?.next
        v_l2 = v_l2?.next
    }
    return root
}


import XCTest

extension XCTestCase {
    func testAddTowNumber() {
        let a1 = [7,2,4,3]
        let a2 = [5,6,4]
        
        let node1 = ListNode.listNode(a1)
        let node2 = ListNode.listNode(a2)
        
        let node = addTwoNumbers(node1, node2)
//        print(node)
        assert(node!.description == "[7,8,0,7]")
        
        
    }
    
    func testReversedListNode() {
        let a1 = [7,2,4,3]
//        let a1 = [7,2]
        let node1 = ListNode.listNode(a1)
        assert(reversedListNode(node1)!.description == "[3,4,2,7]")
    }
}
