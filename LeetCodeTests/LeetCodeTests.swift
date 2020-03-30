//
//  LeetCodeTests.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/22.
//  Copyright © 2020 范摇. All rights reserved.
//

import XCTest
import Foundation

class LeetCodeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        assert(twoSum([2, 7, 11, 15], 9) == [0, 1])
        assert(twoSum([2, 7, 11, 15], 13) == [0, 2])
        assert(twoSum([2, 7, 11, 15], 18) == [1, 2])
        assert(twoSum([2, 7, 11, 15], 17) == [0, 3])
        assert(twoSum([15, 7, 11, 2], 17) == [0, 3])
        assert(twoSum([15, 7, 11, 2], 9) == [1, 3])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
