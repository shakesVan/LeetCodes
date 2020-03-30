//
//  _1227_飞机座位分配概率.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/26.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/problems/airplane-seat-assignment-probability/

import Foundation

func nthPersonGetsNthSeat(_ n: Int) -> Double {
    if n < 2 { return 1 }
    return 0.5
}
