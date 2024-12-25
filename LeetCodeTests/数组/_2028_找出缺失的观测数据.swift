//
//  _2028_找出缺失的观测数据.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2022/3/28.
//  Copyright © 2022 范摇. All rights reserved.
//

import Foundation
private
func missingRolls2(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
    // 计算与平均数的差值
    let minValue = mean * rolls.count - rolls.reduce(0, +)
    var result = [Int].init(repeating: mean, count: n)
    if minValue == 0 {
        return result
    }
    
    if minValue > 0 {
        let x = 6 - mean
        // 所有值都为6，也无法提升平均值
        if x * n < minValue {
            return []
        }
        
        let i = minValue / x
        let iOffsetValue = minValue % x
        
        for offset in 0..<i {
            result[offset] = 6
        }
        
        if iOffsetValue != 0 {
            result[result.count - 1] = mean + iOffsetValue
        }
        
        return result
    }
    
    // 所有值都为1，也无法降低平均值
    let x = mean - 1
    if x * n < -minValue {
        return []
    }
    
    let i = -minValue / x
    let iOffsetValue = -minValue % x
    
    for offset in 0..<i {
        result[offset] = 1
    }
    
    if iOffsetValue != 0 {
        result[result.count - 1] = mean - iOffsetValue
    }
    return result
    
}

private
func missingRolls1(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
    // 计算与平均数的差值
    let minValue = mean * rolls.count - rolls.reduce(0, +)
    var result = [Int]()
    if minValue == 0 {
        for _ in 0..<n {
            result.append(mean)
        }
        return result
    }
    
    if minValue > 0 {
        let x = 6 - mean
        // 所有值都为6，也无法提升平均值
        if x * n < minValue {
            return []
        }
        
        let i = minValue / x
        let iOffsetValue = minValue % x
        
        for _ in 0..<i {
            result.append(6)
        }
        
        if iOffsetValue != 0 {
            result.append(mean + iOffsetValue)
            if i >= n {
                return result
            }
            for _ in (i+1)..<n {
                result.append(mean)
            }
        } else {
            for _ in i..<n {
                result.append(mean)
            }
        }
        
        return result
    }
    
    // 所有值都为1，也无法降低平均值
    let x = mean - 1
    if x * n < -minValue {
        return []
    }
    
    let i = -minValue / x
    let iOffsetValue = -minValue % x
    
    for _ in 0..<i {
        result.append(1)
    }
    
    if iOffsetValue != 0 {
        result.append(mean - iOffsetValue)
        if i >= n {
            return result
        }
        for _ in (i+1)..<n {
            result.append(mean)
        }
    } else {
        for _ in i..<n {
            result.append(mean)
        }
    }
    return result
    
}

private
func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
    // 计算与平均数的差值
    let minValue = mean * rolls.count - rolls.reduce(0, +)
    var result = [Int]()
    if minValue == 0 {
        for _ in 0..<n {
            result.append(mean)
        }
        return result
    }
    
    if minValue > 0 {
        let x = 6 - mean
        // 所有值都为6，也无法提升平均值
        if x * n < minValue {
            return []
        }
        
        let i = minValue / x
        let iOffsetValue = minValue % x
        
        for _ in 0..<i {
            result.append(6)
        }
        
        for _ in i..<n {
            result.append(mean)
        }
        
        if iOffsetValue != 0 {
            result.removeLast()
            result.append(mean + iOffsetValue)
        }
        
        return result
    }
    
    // 所有值都为1，也无法降低平均值
    let x = mean - 1
    if x * n < -minValue {
        return []
    }
    
    let i = -minValue / x
    let iOffseValue = -minValue % x
    
    for _ in 0..<i {
        result.append(1)
    }
    
    for _ in i..<n {
        result.append(mean)
    }
    
    if iOffseValue != 0 {
        result.removeLast()
        result.append(mean - iOffseValue)
    }
    
    return result
    
}



import XCTest
private
class FYMissingRollsTestCase: XCTestCase {
    func testMissingRolls() {
        assert(missingRolls([3,2,4,3], 4, 2) == [6,6])

        assert(missingRolls([1,5,6], 3, 4) == [1, 3, 3, 2])

        assert(missingRolls([1,2,3,4], 6, 4) == [])
        
        assert(missingRolls([1], 3, 1) == [5])
        
    }
    
    func testMissingRolls1() {
        XCTAssertEqual(missingRolls1([3,2,4,3], 4, 2), [6, 6])

        XCTAssertEqual(missingRolls1([1,5,6], 3, 4), [1, 2 ,3, 3])

        XCTAssertEqual(missingRolls1([1,2,3,4], 6, 4), [])
        
        XCTAssertEqual(missingRolls1([1], 3, 1), [5])
        
    }
}
