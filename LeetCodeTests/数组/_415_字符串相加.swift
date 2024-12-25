//
//  _415_字符串相加.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/21.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation


func addStrings(_ num1: String, _ num2: String) -> String {
    let map: [Character: Int] = [
        "0": 0,
        "1": 1,
        "2": 2,
        "3": 3,
        "4": 4,
        "5": 5,
        "6": 6,
        "7": 7,
        "8": 8,
        "9": 9
    ]
    
    // 进1
    var flag = 0
    
    var longArr: [Character] = Array(num1).reversed()
    var shortArr: [Character] = Array(num2).reversed()
    if longArr.count < shortArr.count {
        (longArr, shortArr) = (shortArr, longArr)
    }
    
    var result = [Character]()
    for i in (0..<shortArr.count) {
        var tmp = (map[shortArr[i]] ?? 0) + (map[longArr[i]] ?? 0) + flag
        if tmp >= 10 {
            tmp -= 10
            flag = 1
        } else {
            flag = 0
        }
        let ele = Array<Character>(String(tmp)).last ?? "0"
        result.append(ele)
    }
    
    for i in shortArr.count..<longArr.count {
        if flag == 1 {
            var tmp = (map[longArr[i]] ?? 0) + flag
            if tmp >= 10 {
                tmp -= 10
                flag = 1
            } else {
                flag = 0
            }
            let ele = Array<Character>(String(tmp)).last ?? "0"
            result.append(ele)
        } else {
            result.append(longArr[i])
        }
    }
    if flag == 1 {
        result.append("1")
    }
    
    return String(result.reversed())
}


// 越界
func addStrings1(_ num1: String, _ num2: String) -> String {
    return String(format: "%.0f", (Double(num1) ?? 0) + (Double(num2) ?? 0))
}

import XCTest

class AddStringsCase: XCTestCase {
    func testAddStrings() {
        assert(addStrings("11", "123") == "134")
        
        assert(addStrings("9133", "0") == "9133")
        
        assert(addStrings("3876620623801494171", "6529364523802684779") == "10405985147604178950")
    }
}
