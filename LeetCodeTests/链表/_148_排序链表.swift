//
//  _148_排序链表.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/12.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func sortList(_ head: ListNode?) -> ListNode? {
    var array = [Int]()
    
    var tmp = head
    while let val = tmp?.val {
        
        array.append(val)
        tmp = tmp?.next
    }
    array = array.sorted()
    print("array = \(array)")
    
    var root: ListNode? = ListNode(0)
    var last: ListNode? = root
    for i in 0..<array.count {
        let tmp = ListNode(array[i])
        
        last?.next = tmp
        last = last?.next
    }
    root = root?.next
    
//    print("root = \(root?.description ?? "")")
    return root
}
