//
//  _234_回文链表.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/12.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func isPalindrome(_ head: ListNode?) -> Bool {
    if head?.next == nil {
        return true
    }
    var array = [Int]()
    
    var tmp = head
    while let val = tmp?.val {
        
        array.append(val)
        tmp = tmp?.next
    }
    
    print("array = \(array)")
    let mid = array.count / 2
    for i in 0..<mid {
        if array[i] != array[array.count - i] {
            return false
        }
    }
    return true
}
