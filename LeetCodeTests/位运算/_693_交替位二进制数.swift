//
//  _693_交替位二进制数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2022/3/28.
//  Copyright © 2022 范摇. All rights reserved.
//

import Foundation
private
func hasAlternatingBits(_ n: Int) -> Bool {
    let value = n ^ (n << 1)
    // 判断以下值只有一个1，其余全是0
    value + 2
    value + 1
    
    return false
}

import XCTest
private
class FYTestCase: XCTestCase {
    func testHasAlternatingBits() {
        var n = 5
        var result = false
        XCTAssertEqual(hasAlternatingBits(n), result)
        
        n = 7
        result = false
        XCTAssertEqual(hasAlternatingBits(n), result)
        
        n = 11
        result = false
        XCTAssertEqual(hasAlternatingBits(n), result)
    }
}
