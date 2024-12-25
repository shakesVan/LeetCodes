//
//  _125. 验证回文串.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/19.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/valid-palindrome/

import Foundation
private
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let sa = s.utf8CString
        var left = 0
        var right = sa.count - 1
        
        while left < right {
            if !isCantain(sa[left]) {
                left += 1
                continue
            }
            if !isCantain(sa[right] ) {
                right -= 1
                continue
            }
            
            if lowLetter(sa[left]) != lowLetter(sa[right]) { return false }
            left += 1
            right -= 1
        }
        
        return true
    }
    
    func lowLetter(_ char: CChar) -> CChar {
        if char >= 65 && char <= 90 {
            return char + 32
        }
        return char
    }
    
    func isCantain(_ char: CChar) -> Bool {
        return (char >= 97 && char <= 122) || (char >= 48 && char <= 57) || (char >= 65 && char <= 90)
    }
    
}

import XCTest

extension XCTestCase {
    func testIsPalindrome() {
        let s = Solution()
        assert(s.isPalindrome("A man, a plan, a canal: Panama") == true)
        assert(s.isPalindrome("race a car") == false)
        assert(s.isPalindrome("") == true)
        assert(s.isPalindrome("a") == true)
        assert(s.isPalindrome("0P") == false)
        
    }
}
