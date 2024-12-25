//
//  _160_相交的链表.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/8.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    
    guard let _ = headA,
          let _ = headB else {
        return nil
    }
    
    let countA = count(with: headA)
    let countB = count(with: headB)
    
    var tmpHeadA: ListNode? = headA
    var tmpHeadB: ListNode? = headB
    
    if countA > countB {
        tmpHeadA = skip(with: countA - countB, in: headA)
    } else {
        tmpHeadB = skip(with: countB - countA, in: headB)
    }
    
    while tmpHeadA !== tmpHeadB {
        tmpHeadA = tmpHeadA?.next
        tmpHeadB = tmpHeadB?.next
    }
    
    return tmpHeadA
}

func skip(with count: Int, in listNode: ListNode?) -> ListNode? {
    if count <= 0 {
        return listNode
    }
    var result = listNode
    for _ in 0..<count {
        if result == nil {
            return nil
        }
        result = result?.next
    }
    return result
}

fileprivate
func count(with listNode: ListNode?) -> Int {
    guard let listNode = listNode else {
        return 0
    }
    
    var tmp = listNode
    var result = 1
    while let next = tmp.next {
        tmp = next
        result += 1
    }
    
    return result
}
