//
//  5405. 形成两个异或相等数组的三元组数目.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/10.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/weekly-contest-188/problems/count-triplets-that-can-form-two-arrays-of-equal-xor/

import Foundation

private
func countTriplets(_ arr: [Int]) -> Int {
    var result = 0
    // 求出所有数的异或值
    let all = arr.reduce(0, {$0 ^ $1})
    // i到count-1 异或
    var i_count_1 = all
    let count_1 = arr.count - 1
    for i in 0..<count_1 {
        // i_k 的 异或
        var i_k = i_count_1
        var k = count_1
        // 逆序
        while k > i {
            // 当i到k的异或 等于0时，表示j可以取 k - i 个值
            if i_k == 0 {
                result += k - i
                print("i == \(i), k == \(k), result == \(result)")
            }
            // 去除最后一个值，arr[k] ^ arr[k] == 0
            i_k ^= arr[k]
            k -= 1
        }
        // 重置 i_count_1
        i_count_1 ^= arr[i]
    }
    return result
}

import XCTest

extension XCTestCase {
    func testCountTriplets() {
        assert(countTriplets([2,3,1,6,7]) == 4)
        assert(countTriplets([1,1]) == 1)
        assert(countTriplets([1,1,1]) == 2)
//        assert(countTriplets([1,1,1,1]) == 10)
        assert(countTriplets([1,1,1,1,1]) == 10)
        assert(countTriplets([2,3]) == 0)
        assert(countTriplets([1,3,5,7,9]) == 3)
        assert(countTriplets([7,11,12,9,5,2,7,17,22]) == 8)
        
    }
}
