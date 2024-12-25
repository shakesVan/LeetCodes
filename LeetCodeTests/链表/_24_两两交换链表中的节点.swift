//
//  _24_两两交换链表中的节点.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/12.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func swapPairs(_ head: ListNode?) -> ListNode? {
    var before = head
    var after = head?.next
    
    if after == nil {
        return head
    }
    
    var root: ListNode? = ListNode(0)
    root?.next = head
    
    var prev = root
    while after != nil {
        let tmp = after?.next
        before?.next = tmp
        after?.next = before
        prev?.next = after
        
        prev = before
        before = prev?.next
        after = before?.next
    }
    
    root = root?.next
    return root
}
