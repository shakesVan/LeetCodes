//
//  _392_判断子序列.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.count > haystack.count {
        return -1
    }
    if needle.count == haystack.count {
        return needle == haystack ? 0 : -1
    }
    let ha: [Character] = Array(haystack)
    let na: [Character] = Array(needle)
    var left = 0
    var right = 0
    let count = ha.count - na.count
    while left <= count {
        if right - left == na.count {
            return left
        }
        
        if ha[right] == na[right - left] {
            right += 1
        } else {
            left += 1
            right = left
        }
    }
    return -1
    
}

func isSubsequence(_ s: String, _ t: String) -> Bool {
    
    if s.count > t.count {
        return false
    }
    if s.count == t.count {
        return s == t
    }
    let ta: [Character] = Array(t)
    var sa: [Character] = Array(s).reversed()
    
    for i in 0..<ta.count {
        if sa.count == 0 {
            return true
        }
        if sa[sa.count - 1] == ta[i] {
            sa.removeLast()
            continue
        }
    }
    return sa.count == 0
}

import XCTest

class IsSubsequenceCase: XCTestCase {
    func testIsSubsequence() {
        assert(isSubsequence("abc", "ahbgdc") == true)
        assert(isSubsequence("abc1212", "ahbgdc") == false)
        assert(isSubsequence("gdc", "ahbgdc") == true)
        assert(isSubsequence("axc", "ahbgdc") == false)
    }
}
