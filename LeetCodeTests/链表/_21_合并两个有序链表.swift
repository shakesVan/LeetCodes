//
//  _21_合并两个有序链表.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/1.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var p1 = l1
    var p2 = l2
    
    var root = ListNode(0)
    var node: ListNode? = root
    
    while p1 != nil || p2 != nil {
        if p1 == nil {
            node?.next = p2
            p2 = p2?.next
        } else if let v1 = p1?.val, let v2 = p2?.val, v1 > v2 {
            node?.next = p2
            p2 = p2?.next
        } else {
            node?.next = p1
            p1 = p1?.next
        }
        node = node?.next
    }
    
    return root.next
}

private
func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var p1 = l1
    var p2 = l2
    var node: ListNode? = ListNode(0)
    let root = node
    
    while p1 != nil || p2 != nil {
        if p1 != nil && (p2 == nil || p1!.val < p2!.val) {
            node?.next = ListNode(p1!.val)
            p1 = p1?.next
        }else {
            node?.next = ListNode(p2!.val)
            p2 = p2?.next
        }
        node = node?.next
    }
    
    return root?.next
}

import XCTest

class MergeTwoListsCase: XCTestCase {
    func testMergeTwoLists() {
        let l1 = ListNode.listNode([1,2,4])
        let l2 = ListNode.listNode([1,3,4])
        let l3 = ListNode.listNode([1,1,2,3,4,4])
        
        assert(mergeTwoLists(l1,l2)?.description == l3?.description)
        
        let l11 = ListNode.listNode([])
        let l22 = ListNode.listNode([0])
        
        assert(mergeTwoLists(l11,l22)?.description == l22?.description)
    }
}
