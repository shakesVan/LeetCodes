//
//  _19. 删除链表的倒数第N个节点.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/12.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 
import Foundation
/**
* Definition for singly-linked list.
* public class ListNode {
*     public var val: Int
*     public var next: ListNode?
*     public init(_ val: Int) {
*         self.val = val
*         self.next = nil
*     }
* }
*/
private
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil, n != 0 else { return head }
        var root = head
        var slow = root
        var fast = head
        
        for _ in 0..<n {
            fast = fast?.next
        }
        // 处理
        if nil == fast {
            root = root?.next
            return root
        }
        
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        
        return root
    }
}

import XCTest

extension XCTestCase {
    func testremoveNthFromEnd() {
        let s = Solution()
        var head = ListNode.listNode([1,2,3,4,5])
        var ans = ListNode.listNode([1,2,3,5])
        assert(s.removeNthFromEnd(head, 2)?.description == ans?.description)
        
        head = ListNode.listNode([1])
        ans = ListNode.listNode([])
        assert(s.removeNthFromEnd(head, 1)?.description == ans?.description)
    }
}
