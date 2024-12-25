//
//  _238_除自身以外数组的乘积.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/7.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    let nozeronums = nums.filter { $0 != 0 }
    // 两或以上个0
    if nozeronums.count <= nums.count - 2 {
        return [Int].init(repeating: 0, count: nums.count)
    }
    print("nozeronums = \(nozeronums)")
    let all = nozeronums.reduce(1, { Int64($0) * Int64($1) })
    
    var result = [Int]()
    // 一个0
    if nozeronums.count == nums.count - 1 {
        
        for i in 0..<nums.count {
            if nums[i] != 0 {
                result.append(0)
            } else {
                result.append(Int(all))
            }
        }
        return result
        
    }
    // 无0
    for i in 0..<nums.count {
        result.append(Int(all / Int64(nums[i])))
    }
    return result
}
