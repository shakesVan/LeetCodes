//
//  _383_赎金信.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var map: [Character: Int] = [:]
    ransomNote.forEach { char in
        if let count = map[char] {
            map[char] = count + 1
        } else {
            map[char] = 1
        }
    }
    
    magazine.forEach { char in
        guard let count = map[char] else {
            return
        }
        if count > 1 {
            map[char] = count - 1
        } else {
            map[char] = nil
        }
        
    }
    
    return map.keys.isEmpty
}

import XCTest

class CanConstructCase: XCTestCase {
    func testCanConstruct() {
        assert(canConstruct("a", "b") == false)
        assert(canConstruct("aa", "ab") == false)
        assert(canConstruct("aa", "aab") == true)
        assert(canConstruct("abc", "ahbgdc") == true)
        assert(canConstruct("abc1212", "ahbgdc") == false)
        assert(canConstruct("dgc", "ahbgdc") == true)
        assert(canConstruct("axc", "ahbgdcx") == true)
        assert(canConstruct("axc", "ahbgdc") == false)
    }
}
