//
//  _151_翻转字符串里的单词.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/10.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func reverseWords(_ s: String) -> String {
    return s
        .split(separator: " ")
        .reversed()
        .reduce(into: "") { $0 += ($0.isEmpty ? "" :  " ") + $1 }
}

func reverseWords2(_ s: String) -> String {
    return s
        .split(separator: " ")
        .reversed()
        .enumerated()
        .reduce(into: "") { $0 += ($1.offset != 0 ? " " + $1.element : $1.element ) }
}

import XCTest
extension XCTestCase {
    func testReverseWords() {
        assert(reverseWords("the sky is blue") == "blue is sky the")
        assert(reverseWords("  hello world!  ") == "world! hello")
        assert(reverseWords("a good   example") == "example good a")
        
    }
}
