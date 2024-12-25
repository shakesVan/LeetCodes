//
//  _5413. 重新排列句子中的单词.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/17.
//  Copyright © 2020 范摇. All rights reserved.
//  https://leetcode-cn.com/contest/weekly-contest-189/problems/rearrange-words-in-a-sentence/

import Foundation
private
class Solution {
    func arrangeWords(_ text: String) -> String {
        // 首字母小写
        let arr = text.lowercased().split(separator: " ").map { String($0) }
        
        // 排序不稳定
        let sort = mergeSort1(arr)
        // 首字母大写
        var fir = sort[0]
        let c = fir.removeFirst().uppercased()
        fir = c + fir
        
        for i in 1..<sort.count {
            fir += " \(sort[i])"
        }
        return fir
    }
}

extension Array where Element: Comparable {
    func stableSorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        return mergeSort(self, 0, count, areInIncreasingOrder)
    }

    //归并排序

    private
    func mergeSort(_ array: [Element], _ start: Int = 0, _ end: Int? = nil, _ compare: (Element, Element) -> Bool) -> [Element]{
        let end = end ?? array.count
        if start > end - 2 { return [array[start]] }
        if start == end - 2 {
            let end_1 = end - 1
            if compare(array[start], array[end_1]) {
                return [array[end_1], array[start]]
            }
            return [array[start], array[end_1]]
        }
        let mid = (start + end) >> 1
        var leftA = mergeSort(array, start, mid, compare)
        let rightA = mergeSort(array, mid, end, compare)
        rightA.forEach { (item) in
            leftA.append(leftA[0])
        }
        print("leftA == \(leftA), rightA == \(rightA)")
        
        var p1 = mid - start - 1
        var p2 = end - mid - 1
        var index = rightA.count - 1
        while p1 >= 0 && p2 >= 0 {
            if compare(leftA[p1], rightA[p2]) {
                leftA[index] = leftA[p1]
                p1 -= 1
            }else {
                leftA[index] = rightA[p2]
                p2 -= 1
            }
            index -= 1
        }
        
        while p2 >= 0 {
            leftA[index] = rightA[p2]
            p2 -= 1
            index -= 1
        }
        print("leftA == \(leftA), [\(start), \(end))")
        
        return leftA
    }
}






private
func mergeSort1(_ array: [String], _ start: Int = 0, _ end: Int? = nil) -> [String]{
    let end = end ?? array.count
    if start > end - 2 { return [array[start]] }
    if start == end - 2 {
        let end_1 = end - 1
        if array[start].count > array[end_1].count {
            return [array[end_1], array[start]]
        }
        return [array[start], array[end_1]]
    }
    let mid = (start + end) >> 1
    var leftA = mergeSort1(array, start, mid)
    let rightA = mergeSort1(array, mid, end)
    rightA.forEach { (item) in
        leftA.append(leftA[0])
    }
    print("leftA == \(leftA), rightA == \(rightA)")
    merge(&leftA, mid - start, rightA, rightA.count)
    print("leftA == \(leftA), [\(start), \(end))")
    
    return leftA
}

private
func merge(_ nums1: inout [String], _ m: Int, _ nums2: [String], _ n: Int) {
    
    var p1 = m-1
    var p2 = n-1
    var index = m + n - 1
    while p1 >= 0 && p2 >= 0 {
        if nums1[p1].count > nums2[p2].count {
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
    func testArrangeWords() {
        let s = Solution()
        
        assert(s.arrangeWords("Leetcode is cool") == "Is cool leetcode")
        
        assert(s.arrangeWords("Leetcode is on cool") == "Is on cool leetcode")

        assert(s.arrangeWords("Leetcode on in cool") == "On in cool leetcode")

        assert(s.arrangeWords("Keep calm and code on") == "On and keep calm code")
        assert(s.arrangeWords("To be or not to be") == "To be or to be not")
        
    }
}
