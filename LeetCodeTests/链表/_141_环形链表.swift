//
//  _141_环形链表.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/12.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func hasCycle(_ head: ListNode?) -> Bool {
    var fast = head
    var slow = head
    
    while fast != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if fast === slow {
            return fast != nil
        }
    }
    
    return false
}
