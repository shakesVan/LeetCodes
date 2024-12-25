//
//  _2425_所有数对的异或和.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/29.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var reslut = 0
    if nums2.count % 2 != 0 {
        reslut = nums1.reduce(reslut, {
            $0 ^ $1
        })
    }
    
    if nums1.count % 2 != 0 {
        reslut = nums2.reduce(reslut, {
            $0 ^ $1
        })
    }
    
    return reslut
}


