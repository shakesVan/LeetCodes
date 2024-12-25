//
//  归并排序.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/17.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
typealias Element = Int
private
func mergeSort(_ array: [Element], _ start: Int = 0, _ end: Int? = nil) -> [Element]{
    let end = end ?? array.count
    if start > end - 2 { return [array[start]] }
    if start == end - 2 {
        let end_1 = end - 1
        if array[start] > array[end_1] {
            return [array[end_1], array[start]]
        }
        return [array[start], array[end_1]]
    }
    let mid = (start + end) >> 1
    var leftA = mergeSort(array, start, mid)
    let rightA = mergeSort(array, mid, end)
    rightA.forEach { (_) in
        leftA.append(0)
    }
    print("leftA == \(leftA), rightA == \(rightA)")
    merge(&leftA, mid - start, rightA, rightA.count)
    print("leftA == \(leftA), [\(start), \(end))")
    
    return leftA
}

private
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var p1 = m-1
    var p2 = n-1
    var index = m + n - 1
    while p1 >= 0 && p2 >= 0 {
        if nums1[p1] > nums2[p2] {
            nums1[index] = nums1[p1]
            p1 -= 1
        }else {
            nums1[index] = nums2[p2]
            p2 -= 1
        }
        index -= 1
    }
    
    while p2 >= 0 {
        nums1[index] = nums2[p2]
        p2 -= 1
        index -= 1
    }
    
}

import XCTest

extension XCTestCase {
    func testMergeSort() {
        
        assert(mergeSort([9,8,7,6,5]) == [5,6,7,8,9])
        assert(mergeSort([9,7,8,6,5,1]) == [1,5,6,7,8,9])
    }
}
