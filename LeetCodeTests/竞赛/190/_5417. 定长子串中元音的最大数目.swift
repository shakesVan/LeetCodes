//
//  _5417. 定长子串中元音的最大数目.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/24.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        var left = 0
        var right = 0
        let need: Set<Character> = ["a", "e", "i", "o", "u"]
        let arr = Array(s)
        var vaild = 0
        var length = 0
        while right < arr.count {
            if need.contains(arr[right]) {
                vaild += 1
//                print("out vaild = \(vaild), length = \(length), left = \(left), right = \(right)")
                if vaild == k { return k }
                length = max(length, vaild)
            }
            
            while right - left >= k - 1 {
                if need.contains(arr[left]) {
                    vaild -= 1
//                    print("in vaild = \(vaild), length = \(length), left = \(left), right = \(right)")
                }
                left += 1
            }
            right += 1
        }
        
        return length
    }
}

import XCTest

extension XCTestCase {
    func testMaxVowels() {
        let solution = Solution()
        var s = "abciiidef"
        var k = 3
        assert(solution.maxVowels(s, k) == 3)
        s = "aeiou"
        k = 2
        assert(solution.maxVowels(s, k) == 2)
        s = "leetcode"
        k = 3
        assert(solution.maxVowels(s, k) == 2)
        s = "rhythms"
        k = 4
        assert(solution.maxVowels(s, k) == 0)
        s = "tryhard"
        k = 4
        assert(solution.maxVowels(s, k) == 1)
    }
}
