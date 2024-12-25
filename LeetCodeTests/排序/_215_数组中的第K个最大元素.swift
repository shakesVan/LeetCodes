//
//  _215_数组中的第K个最大元素.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/22.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    if k == 0 || nums.count == 0 || nums.count < k {
        return 0
    }
    
    var minTop = [Int].init(repeating: Int.min, count: k)
    for num in nums {
        if num > minTop[0] {
            minTop[0] = num
            // 更新minTop的位置
            updateMinTopTop(&minTop)
        }
    }
    return minTop[0]
}

func updateMinTopTop(_ arr: inout [Int]) {
    var index = 0
    while index < arr.count {
        let left = index << 1 + 1
        let right = left + 1
        if right > arr.count {
            break
        }
        if right == arr.count {
            // 交换值
            if (arr[index] > arr[left]) {
                (arr[index], arr[left]) = (arr[left], arr[index])
            }
            break
        }
        // 确定小值
        if arr[index] <= min(arr[left], arr[right]) {
            break
        }
        
        if arr[left] >= arr[right] {
            if arr[index] <= arr[right] {
                break
            }
            (arr[index], arr[right]) = (arr[right], arr[index])
            index = right
        } else {
            if arr[index] <= arr[left] {
                break
            }
            (arr[index], arr[left]) = (arr[left], arr[index])
            index = left
        }
    }
}

func findKthLargest1(_ nums: [Int], _ k: Int) -> Int {
    if nums.count < k {
        return 0
    }
    return nums.sorted(by: >)[k - 1]
}

import XCTest



import XCTest

class FindKthLargestCase: XCTestCase {
    func testFindKthLargest() {
        assert(findKthLargest([1,2,3,5,4], 2) == 4)
        assert(findKthLargest([3,2,3,1,2,4,5,5,6], 4) == 4)
        assert(findKthLargest([1], 2) == 0)
    }
}
