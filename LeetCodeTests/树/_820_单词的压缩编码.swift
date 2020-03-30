//
//  _820_单词的压缩编码.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/28.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func minimumLengthEncoding(_ words: [String]) -> Int {
    guard words.count > 0 else {
        return 0
    }
    if words.count == 1 {
        return words[0].count + 1
    }
    let rw = words.map { String($0.reversed()) }.sorted()
    
    var sum = 0
    
    print("rw == \(rw)")
    for i in 0..<rw.count-1 {
        if !rw[i+1].hasPrefix(rw[i]) {
            sum += rw[i].count + 1
//            print("sum == \(sum)")
        }
        
    }
    sum += (rw.last?.count ?? 0) + 1
//    print("final sum == \(sum)")
    return sum
}

import XCTest
extension XCTestCase {
    func testMinimumLengthEncoding() {
        assert(minimumLengthEncoding(["time", "me", "bell"]) == 10)
        
        assert(minimumLengthEncoding(["time", "bell","me"]) == 10)
        
        assert(minimumLengthEncoding(["time", "bell","me", "egg"]) == 14)
        
        assert(minimumLengthEncoding(["time"]) == 5)
        
        assert(minimumLengthEncoding(["times", "mes"]) == 6)
    }
}
