//
//  _53_最大子序和.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/1.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
/**
 分治 start = 0, end = count
 首先把nums拆分成两段，[start, mid), [mid, end) min = (start + end) >> 1
 最大子序和只有三种情况：
 在左边，
 在右边，
 跨越左右，
 比较三者，取最大值，在跨越两边的，直接求最大值，在左右两边的修改start或者end值重复以上步骤
 */
func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    return maxSubDev(nums, 0, nums.count)
}
func maxSubDev(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
    if start == end - 1 { return max(Int.min, nums[start]) }
    let mid = (start + end) >> 1
    let lv = maxSubDev(nums, start, mid)
    let rv = maxSubDev(nums, mid, end)
    let mv = getMaxMid(nums, start, mid, end)
    
    return max(mv, max(lv, rv))
}

func getMaxMid(_ nums: [Int], _ start: Int, _ mid: Int, _ end: Int) -> Int {
    
    var midMV1 = Int.min
    var tmpV = 0
    var idx = mid
    // [start, mid) 左闭右开，所以从 mid - 1 开始，到start
    while idx > start {
        idx -= 1
        tmpV += nums[idx]
        if tmpV > midMV1 {
            midMV1 = tmpV
        }
    }
    
    var midMV2 = Int.min
    tmpV = 0
    idx = mid
    // [mid, end) 左闭右开，所以从 mid 开始 到end - 1
    while idx < end {
        tmpV += nums[idx]
        if tmpV > midMV2 {
            midMV2 = tmpV
        }
        idx += 1
    }
    return midMV1 + midMV2
}

func maxSubDev1(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
    if start == end { return Int.min }
    if start == end - 1 { return max(Int.min, nums[start]) }
    let mid = (start + end) >> 1
    let lv = maxSubDev(nums, start, mid)
    let rv = maxSubDev(nums, mid, end)
    
    var leftV = 0
    var midMV1 = Int.min
    var idx = mid - 1
    while start <= idx {
        leftV += nums[idx]
        if leftV > midMV1 {
            midMV1 = leftV
        }
        idx -= 1
    }
    
    var rightV = 0
    var midMV2 = Int.min
    idx = mid
    while idx < end {
        rightV += nums[idx]
        if rightV > midMV2 {
            midMV2 = rightV
        }
        idx += 1
    }
    
    return max(midMV1 + midMV2, max(lv, rv))
}
/**
 动态规划解法
 */
func maxSubArray3(_ nums: [Int]) -> Int {
    var dp = Int.min
    var maxV = dp
    for num in nums {
        if dp > 0 {
            dp += num
        }else {
            dp = num
        }
        if dp > maxV {
            maxV = dp
        }
    }
    return maxV
}

func maxSubArray2(_ nums: [Int]) -> Int {
    var dp = nums[0]
    var maxV = dp
    var num: Int
    for i in 1..<nums.count {
        num = nums[i]
        if dp > 0 {
            dp += num
        }else {
            dp = num
        }
        if dp > maxV {
            maxV = dp
        }
    }
    
    return maxV
}

func maxSubArray1(_ nums: [Int]) -> Int {
    var dp = nums[0]
    var maxV = dp
    for i in 1..<nums.count {
        dp = dp > 0 ? dp + nums[i] : nums[i]
        maxV = max(dp, maxV)
    }
    
    return maxV
}


import XCTest

extension XCTestCase {
    func testMaxSubArray() {
        assert(maxSubArray([]) == 0)
        assert(maxSubArray([0]) == 0)
        assert(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) == 6)
        assert(maxSubArray([-1]) == -1)
        assert(maxSubArray([-2,-1]) == -1)
        
        
    }
}


