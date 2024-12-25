//
//  190_1.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/24.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class Solution {
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        let arr = Array(sentence.split(separator: " ").map { String ($0) })
        for i in 0..<arr.count {
            
            if arr[i].hasPrefix(searchWord) {
                return i + 1
            }
        }
        return -1
    }
}


import XCTest

extension XCTestCase {
    func testIsPrefixOfWord() {
        let s = Solution()
        var sentence = "i love eating burger"
        var searchWord = "burg"
        assert(s.isPrefixOfWord(sentence, searchWord) == 4)
        
        sentence = "this problem is an easy problem"
        searchWord = "pro"
        assert(s.isPrefixOfWord(sentence, searchWord) == 2)
        sentence = "i am tired"
        searchWord = "you"
        assert(s.isPrefixOfWord(sentence, searchWord) == -1)
        sentence = "i use triple pillow"
        searchWord = "pill"
        assert(s.isPrefixOfWord(sentence, searchWord) == 4)
        
        sentence = "hello from the other side"
        searchWord = "they"
        assert(s.isPrefixOfWord(sentence, searchWord) == -1)
//        assert(s.busyStudent([1,2,3], [3,2,7], 4) == 1)
//        assert(s.busyStudent([4], [4], 4) == 1)
//        assert(s.busyStudent([4], [4], 5) == 0)
//        assert(s.busyStudent([1,1,1,1], [1,3,2,4], 7) == 0)
//        assert(s.busyStudent([9,8,7,6,5,4,3,2,1], [10,10,10,10,10,10,10,10,10], 5) == 5)
        
    }
}
