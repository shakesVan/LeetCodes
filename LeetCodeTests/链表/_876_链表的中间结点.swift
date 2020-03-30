//
//  876_链表的中间结点.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/23.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
import XCTest

class _876_链表的中间结点 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        if fast?.next != nil {
            return slow?.next
        }else {
            return slow
        }
    }
}



class _876_链表的中间结点Tests: XCTestCase {
    
    func testCase() {
        let a1 = [2,4,3,2,4,3,1,2]
        let a2 = [5,6,4,2,4]
        
        let a3 = [5]
        
        let node1 = ListNode.listNode(a1)
        print(node1!)
        
        
        let solution = _876_链表的中间结点()
        let node = solution.middleNode(node1)
        print(node!)
        assert(node!.description == "[4,3,1,2]")
        
        
        let node2 = ListNode.listNode(a2)
        let n2 = solution.middleNode(node2)
        print(n2!)
        assert(n2!.description == "[4,2,4]")
        
        
        let node3 = ListNode.listNode(a3)
        let n3 = solution.middleNode(node3)
        print(n3!)
        assert(n3!.description == "[5]")
    }
}
