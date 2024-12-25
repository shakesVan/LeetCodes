//
//  _3274_检查棋盘方格颜色.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/12/3.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func checkTwoChessboards(_ coordinate1: String, _ coordinate2: String) -> Bool {
    let value1 = Int(coordinate1.first?.asciiValue ?? 0) + Int(coordinate1.last?.asciiValue ?? 0)
    let value2 = Int(coordinate2.first?.asciiValue ?? 0) + Int(coordinate2.last?.asciiValue ?? 0)
    return (value2 - value1) % 2 == 0
}
