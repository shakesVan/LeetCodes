//
//  _5409. 检查一个字符串是否包含所有长度为 K 的二进制子串.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/30.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {
    // 超时
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        
        let count = Int(pow(2, Double(k)))
        if s.count <= count { return false }
        for i in 0..<count {
            let form = "%0\(k)d"
            let subStr = String.init(format: form, Int(String(i,radix:2))!)//
            
            if !isSubString(s, subStr) {
                return false
            }
        }
        
        return true
    }
    
    func isSubString(_ superS: String,_ otherS: String) -> Bool {
        if otherS.count == 0 { return true }
        if superS.count == 0 { return false }
        let sA = Array(superS)
        let oA = Array(otherS)
        
        var sIdx = 0
        var oIdx = 0
        
        let sACount_1 = sA.count - 1
        let oACount_1 = oA.count - 1
        
        while sIdx <= sACount_1 {
            
            if sA[sIdx] == oA[oIdx] {
                sIdx += 1
                oIdx += 1
                
                if oIdx > oACount_1 {
//                    print("superS == \(superS), otherS == \(otherS), true")
                    return true
                }
            }else {
                sIdx -= oIdx - 1
                oIdx = 0
            }
        }
        
//        print("superS == \(superS), otherS == \(otherS), false")
        
        return false
    }
}

import XCTest

extension XCTestCase {
    func testHasAllCodes() {
        let s = Solution()
        var s1 = "00110110"
        var k = 2
//        assert(s.hasAllCodes(s1, k) == true)

        s1 = "00110"
        k = 2
        assert(s.hasAllCodes(s1, k) == true)

        s1 = "0110"
        k = 1
        assert(s.hasAllCodes(s1, k) == true)
        
        s1 = "0110"
        k = 2
        assert(s.hasAllCodes(s1, k) == false)
        
        
        s1 = "0000000001011100"
        k = 4
        assert(s.hasAllCodes(s1, k) == false)
    }
}
