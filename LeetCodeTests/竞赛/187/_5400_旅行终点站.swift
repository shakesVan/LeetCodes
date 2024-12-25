//
//  _5400_旅行终点站.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/3.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/destination-city/
// https://leetcode-cn.com/contest/weekly-contest-187/problems/destination-city/

import Foundation

private
func destCity(_ paths: [[String]]) -> String {
    var map = [String : String]()
    
    for path in paths {
        map[path[0]] = path[1]
    }
    
    var key = paths[0][0]
    while map[key] != nil {
        key = map[key]!
    }
    
    return key
}

import XCTest

extension XCTestCase {
    func testDestCity() {
        assert(destCity([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]) == "Sao Paulo")
        assert(destCity([["B","C"],["D","B"],["C","A"]]) == "A")
        
        assert(destCity([["A","Z"]]) == "Z")
        
    }
}
