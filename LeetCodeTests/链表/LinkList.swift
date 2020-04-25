//
//  Node.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/23.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static public func listNode(_ vals: [Int]) -> ListNode? {
        guard vals.count > 1 else { return nil }
        var node: ListNode? = ListNode(vals[0])
        let root = node
        for val in 0..<vals.count {
            node?.next = ListNode(vals[val])
            node = node?.next
        }
        return root?.next
    }
    
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        var node: ListNode? = self
        var printS = "["
        while node != nil {
            printS += "\(node!.val)"
            node = node!.next
            if node != nil {
                printS += ","
            }
        }
        printS += "]"
        return printS
        
    }
}
