//
//  _680. 验证回文字符串 Ⅱ.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/19.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class Solution {
    func isSubStrValid(_ str: [Character], _ p1 : Int, _ p2 : Int) -> Bool {
        if p1 == p2 {
            return true
        }
        
        var q1 = p1, q2 = p2
        while(q1<q2) {
            if str[q1] == str[q2] {
                q1 += 1
                q2 -= 1
            } else {
                return false
            }
        }
        return true
    }
    // 216
    func validPalindrome(_ s: String) -> Bool {
        let str = Array(s)
        if str.count <= 1 {
            return true
        }
        
        var p1 = 0, p2 = str.count - 1
        while(p1<p2) {
            if str[p1] == str[p2] {
                p1 += 1
                p2 -= 1
            } else {
                return isSubStrValid(str, p1, p2-1) || isSubStrValid(str, p1+1, p2)
            }
        }
        return true
    }
    //256
    func validPalindrome1(_ s: String) -> Bool {
        guard s.count > 2 else { return true }
        var left = 0
        var right = s.count - 1
        let sa = Array(s)
        while left < right {
            if sa[left] == sa[right] {
                left += 1
                right -= 1
            }else {
                return isValidPalindrome(sa,left,right-1) || isValidPalindrome(sa,left+1,right)
                
            }
        }
        
        return true
    }
    
    func isValidPalindrome(_ sa: Array<Character>, _ left: Int, _ right: Int) -> Bool {
        if left == right { return true }
        var left = left
        var right = right
        while left < right {
            if sa[left] == sa[right] {
                left += 1
                right -= 1
            } else  {
                return false
            }
            
        }
        
        return true
    }
}



import XCTest

extension XCTestCase {
    func testValidPalindrome() {
        let s = Solution()
        assert(s.validPalindrome("amanaplanacanalpanama") == true)
        assert(s.validPalindrome("raceacar") == true)
        assert(s.validPalindrome("raceabcar") == false)
        assert(s.validPalindrome("") == true)
        assert(s.validPalindrome("a") == true)
        assert(s.validPalindrome("0P") == true)
        
        assert(s.validPalindrome("raceacar") == true)
        assert(s.validPalindrome("aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga") == true)
        
    }
}

//"aguok epatg bnvfq mgmlc upuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuup
//uc ulmgm qfvnb gtape kouga"
