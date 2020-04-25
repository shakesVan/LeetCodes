//
//  _5388_重新格式化字符串.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/19.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func reformat(_ s: String) -> String {
    let a = Array(s)
    var nums = [Character]()
    var s1 = [Character]()
    
    for char in a {
        if char >= "0" && char <= "9" {
            nums.append(char)
        }else {
            s1.append(char)
        }
    }
    let ab = abs(nums.count - s1.count)
    if ab > 1 { return "" }
    var reslut = ""
    if ab == 0 {
        for i in 0..<nums.count {
            reslut.append(nums[i])
            reslut.append(s1[i])
        }
        return reslut
    }
    
    if nums.count > s1.count {
        for i in 0..<s1.count {
            reslut.append(nums[i])
            reslut.append(s1[i])
        }
        reslut.append(nums[nums.count-1])
    }else {
        for i in 0..<nums.count {
            reslut.append(s1[i])
            reslut.append(nums[i])
        }
        reslut.append(s1[s1.count - 1])
    }
    
    return reslut
}

import XCTest

extension XCTestCase {
    func testReformat() {
        assert(reformat("a0b1c2").count == 6)
        assert(reformat("leetcode").count == 0)
        assert(reformat("1229857369").count == 0)
        assert(reformat("covid2019").count == 9)
        assert(reformat("ab123").count == 5)
        
    }
    
}
