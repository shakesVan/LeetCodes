//
//  _66_加一.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/24.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var result: [Int] = []
    var flag = 1
    for digit in digits.reversed() {
        if digit + flag >= 10 {
            result.append(digit + flag - 10)
            flag = 1
        }else {
            result.append(digit + flag)
            flag = 0
        }
    }
    if flag != 0 {
        result.append(flag)
    }
    return result.reversed()
}
