//
//  2_两数之和.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/22.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/add-two-numbers/

import Foundation
import XCTest


class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var node: ListNode?
        
        var root = node
        var v_l1 = l1
        var v_l2 = l2
        
        var carry = 0
        while v_l1 != nil || v_l2 != nil || carry != 0 {
            var item = (v_l1?.val ?? 0) + (v_l2?.val ?? 0) + carry
            if item > 9 {
                item -= 10
                carry = 1
            }else {
                carry = 0
            }
            
            let next = ListNode(item)
            if node == nil {
                node = next
                root = node
            }else {
                node?.next = next
                node = node?.next
            }
            v_l1 = v_l1?.next
            v_l2 = v_l2?.next
        }
        return root
    }
    
    func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?
    {
        var ll1 = l1 ,ll2 = l2 ,node = ListNode(0)
        let nodes = node
        var flag = 0
        while (ll1?.val != nil || ll2?.val != nil || flag == 1)
        {
            let num1 : Int = ll1?.val ?? 0
            let num2 : Int = ll2?.val ?? 0
            var num = num1 + num2 + flag
            if num > 9
            {
                num = num%10
                flag = 1
            }else
            {
                flag = 0
            }
            node.next = ListNode(num)
            node = node.next!
            ll1  = ll1?.next
            ll2  = ll2?.next
        }
        return nodes.next
    }
    
}

class AddTwoNumbersCase: XCTestCase {
    
    func testCase() {
        let a1 = [2,4,3,2,4,3,1,2]
        let a2 = [5,6,4,2,4,7]
        
        let node1 = ListNode.listNode(a1)
        let node2 = ListNode.listNode(a2)
        
        let solution = Solution()
        let node = solution.addTwoNumbers(node1, node2)
        print(node!)
        assert(node!.description == "[7,0,8,4,8,0,2,2]")
    }
}
