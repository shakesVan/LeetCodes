//
//  _142_环形链表2.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/12.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

fileprivate
func getHashString(_ node: ListNode) -> String {
    return "\(Unmanaged.passUnretained(node).toOpaque())"
}

func detectCycle(_ head: ListNode?) -> ListNode? {
    
    var map: [String: ListNode] = [:]
    
    var tmp = head
    while let node = tmp {
        if let value = map[getHashString(node)] {
            return value
        }
        map[getHashString(node)] = node
        tmp = tmp?.next
    }
    
    return nil
}
