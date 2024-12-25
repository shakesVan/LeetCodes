//
//  _25_K个一组翻转链表.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/20.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


func reverseKGroup2(_ head: ListNode?, _ k: Int) -> ListNode? {
    if k <= 1 {
        return head
    }
    var array: [ListNode?] = []
    
    var cur = head
    while cur != nil {
        array.append(cur)
        print("cur = \(cur?.val)")
        cur = cur?.next
        array.last??.next = nil
    }
    
    if array.count < k {
        return head
    }
    let times = array.count / k
    print("k = \(k), times = \(times)")
    if times * k < array.count {
        array[(times - 1) * k]?.next = array[times * k]
        
        for i in (times*k)..<(array.count-1) {
            array[i]?.next = array[i+1]
        }
    }
    
    print("times = \(times), array = \(array)")
    var root: ListNode? = array[k-1]
    for i in 0..<times {
        
        for j in (0..<k).reversed() {
            let index = i * k + j
            if j != 0 {
                array[index]?.next = array[index - 1]
            } else if (i + 2) * k - 1 < array.count {
                array[index]?.next = array[(i + 2) * k - 1]
            }
            
            print("i = \(i), j = \(j), array[index] = \(array[index]?.val)")
        }
        print("i = \(i), array = \(array)")
    }
    
    print("root = \(root?.description)")
    return root
}

fileprivate
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let root: ListNode? = ListNode(0)
    root?.next = head
    
    var cur = head
    var flag = false
    while true {
        let (isEnd, after) = reverseGroup(root, cur, k)
        if after == nil {
            flag = isEnd
            break
        }
        cur = after
        print("======\(root!)")
    }
    if !flag {
        _ = reverseGroup(root, cur, k)
    }
    
    return root?.next
}


/// 旋转前times个链表
/// - Parameters:
/// - Returns: 是否执行了times次
func reverseGroup(_ before: ListNode?,_ cur: ListNode?,_ times: Int) -> (Bool, ListNode?) {
 
    print("start \(before!)")
    if cur == nil || times <= 1 {
        return (true, cur)
    }
    var after = cur?.next
    for _ in 0..<(times) {
        cur?.next = after?.next
        after?.next = before?.next
        before?.next = after
        // 执行time次结束
//        if i == times - 2 {
//            break
//        }
        // 中途结束
        if after == nil {
            print("error end \(before!)")
            return (false, after)
        }
//        cur = after
        after = cur?.next
        
        print("roop \(before!)")
    }
    print("end \(before!)")
    return (true, after)
}

import XCTest

class ReverseKGroupCase: XCTestCase {
    func testReverseGroup() {
        
        let head = ListNode.listNode([1,2,3,4,5])
        let ans = ListNode.listNode([2,1,3,4,5])
        let before = ListNode(0)
        before.next = head
//        assert(reverseGroup(before, head, 2).1?.description == ans?.description)
        print("======")
    }
    
    func testReverseKGroup() {
        
        let head = ListNode.listNode([1,2,3,4,5])
        let ans = ListNode.listNode([2,1,4,3,5])
        
        assert(reverseKGroup(head, 2)?.description == ans?.description)
        print("======")
        
    }
}
