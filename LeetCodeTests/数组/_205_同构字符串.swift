//
//  _205_同构字符串.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    
    if s.count != t.count {
        return false
    }
        
    var amap: [Character: Character] = [:]
    var tmap: [Character: Character] = [:]
    let sa: [Character] = Array(s)
    let ta: [Character] = Array(t)
    for i in 0..<sa.count {
        let char1 = amap[sa[i]]
        let char2 = tmap[ta[i]]
        
        if char1 == nil && char2 == nil {
            amap[sa[i]] = ta[i]
            tmap[ta[i]] = sa[i]
            continue
        } else if char1 == nil {
            amap[sa[i]] = ta[i]
        } else if char2 == nil {
            if char1 != ta[i] {
                return false
            }
            continue
        }
        if char1 != ta[i] || char2 != sa[i] {
            return false
        }
    }
    
    return true
}

import XCTest

class IsIsomorphicCase: XCTestCase {
    func testIsIsomorphic() {
        assert(isIsomorphic("badc", "baba") == false)
        assert(isIsomorphic("a", "b") == true)
        assert(isIsomorphic("aa", "ab") == false)
        assert(isIsomorphic("aa", "aab") == false)
        assert(isIsomorphic("abc", "ahbgdc") == false)
        assert(isIsomorphic("egg", "add") == true)
        assert(isIsomorphic("paper", "title") == true)
        
    }
}
