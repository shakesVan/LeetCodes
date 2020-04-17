//
//  _1143_最长公共子序列.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/12.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

extension String {
    public func getIndex(_ offset: Int)-> Character {
        return self[index(startIndex, offsetBy: offset)]
    }
}

/**
 a,b
 定义状态：dp(i,j)表示 a[i]与b[j]的最长公共子序列
 初始值：dp(0,0) = a[0] == b[0] ? 1 : 0
 状态转移方程：dp(i,j)
 如果a[i] == b[j] dp(i,j) = dp(i-1,j-1) + 1
 如果a[i] != b[j] dp(i,j) = max(dp(i-1,j),dp(i,j-1))
 */

// 滚动数组3 改进
func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    
    let a = Array(text1)
    let b = Array(text2)
    guard a.count > 0 && b.count > 0 else {
        return 0
    }
    var dp = Array(repeating: Array(repeating: 1, count: b.count), count: 2)

    for j in 0..<b.count {
        if a[0] == b[j] {
            break
        }else {
            dp[0][j] = 0
        }
    }
//    print("i == \(0), dp == \(dp)")
    
    var index = 0
    var _1_index = 1
    for i in 1..<a.count {
        index = i & 1
        _1_index = 1 - index
        dp[index][0] = a[i] == b[0] ? 1 : dp[_1_index][0]
        
        for j in 1..<b.count {
            if a[i] == b[j] {
                dp[index][j] = dp[_1_index][j-1] + 1
            }else {
                dp[index][j] = max(dp[_1_index][j],dp[index][j-1])
            }
        }

//        print("i == \(i), dp == \(dp)")
    }
    return dp[index][b.count-1]
}
// 92 ms
func longestCommonSubsequence4(_ text1: String, _ text2: String) -> Int {
    let a = Array(text1)
    let b = Array(text2)
    guard a.count > 0 && b.count > 0 else {
        return 0
    }
    var dp = Array(repeating: Array(repeating: 1, count: b.count), count: a.count)
    
    var find = false
    for i in 0..<a.count {
        if find || a[i] == b[0] {
            dp[i][0] = 1
            find = true
            break
        }else {
            dp[i][0] = 0
        }
    }
    
    find = false
    for j in 0..<b.count {
        if find || a[0] == b[j] {
            dp[0][j] = 1
            find = true
            break
        }else {
            dp[0][j] = 0
        }
    }
    
    for i in 1..<a.count {
        for j in 1..<b.count {
            if a[i] == b[j] {
                dp[i][j] = dp[i-1][j-1] + 1
            }else {
                dp[i][j] = max(dp[i-1][j],dp[i][j-1])
            }
        }
    }
    
    return dp[a.count - 1][b.count - 1]
}




// 滚动数组3 超时
func longestCommonSubsequence3(_ text1: String, _ text2: String) -> Int {
    guard text1.count > 0 && text2.count > 0 else {
        return 0
    }
    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1),
                   count: 2)
//    var str = "[\n"

    var index = 0
    for i in 1...text1.count {
        index = i & 0b1
//        str += "["
        for j in 1...text2.count {
            
            if text1.getIndex(i-1) == text2.getIndex(j-1) {
                dp[index][j] = dp[1-index][j-1] + 1
            }else {
                dp[index][j] = max(dp[1-index][j], dp[index][j-1])
            }
            
//            str += "\(dp[index][j]) "
        }
//        print("index == \(index)")
//        str += "]\n"
    }
//    str += "]"
//    print(str)
    
    return dp[index][text2.count]
}


// 超时第二版
func longestCommonSubsequence2(_ text1: String, _ text2: String) -> Int {
    guard text1.count > 0 && text2.count > 0 else {
        return 0
    }
    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1),
                   count: text1.count + 1)

    
    var str = "[\n"

    
    for i in 1...text1.count {
        str += "["
        for j in 1...text2.count {
            
            if text1.getIndex(i-1) == text2.getIndex(j-1) {
                dp[i][j] = dp[i-1][j-1] + 1
            }else {
                if dp[i-1][j] > dp[i][j-1] {
                    dp[i][j] = dp[i-1][j]
                }else {
                    dp[i][j] = dp[i][j-1]
                }
                
            }
            
            str += "\(dp[i][j]) "
        }
        str += "]\n"
    }
    str += "]"
    print(str)
    
    return dp[text1.count][text2.count]
}

// 超时第一版
func longestCommonSubsequence1(_ text1: String, _ text2: String) -> Int {
    guard text1.count > 0 && text2.count > 0 else {
        return 0
    }
    var dp = Array(repeating: Array(repeating: 0, count: text2.count),
                   count: text1.count)

    
    var str = "[\n"
    dp[0][0] = text1.getIndex(0) == text2.getIndex(0) ? 1 : 0

    // 初始化dp[i][0]
    for i in 1..<text1.count {
        dp[i][0] = max(dp[i - 1][0], text2.getIndex(0) == text1.getIndex(i) ? 1 : 0)
    }

    // 初始化dp[0][j]
    for j in 1..<text2.count {
        dp[0][j] = max(dp[0][j - 1], text1.getIndex(0) == text2.getIndex(j) ? 1 : 0)
    }
    
    for i in 1..<text1.count {
        str += "["
        for j in 1..<text2.count {
            
            if text1.getIndex(i) == text2.getIndex(j) {
                dp[i][j] = dp[i-1][j-1] + 1
            }else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
            
            str += "\(dp[i][j]) "
        }
        str += "]\n"
    }
    str += "]"
    print(str)
    
    return dp[text1.count - 1][text2.count - 1]
}

import XCTest
extension XCTestCase {
    func testLongestCommonSubsequence() {
        assert(longestCommonSubsequence("abcde", "ace") == 3)
        assert(longestCommonSubsequence("abc", "abc") == 3)
        assert(longestCommonSubsequence("abc", "def") == 0)
        
        assert(longestCommonSubsequence("ezupkr", "ubmrapg") == 2)
        assert(longestCommonSubsequence("a", "n") == 0)
        assert(longestCommonSubsequence("a", "a") == 1)
        
    }
}

