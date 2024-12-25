//
//  _5. 最长回文子串.swift .swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/21.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
private
class Solution {

    /***
     定义状态：dp(i，j),表示 i到j 以i开头，以j结尾的回文子串长度 0 <= i <= j < s.count
     初始值：dp(0,0) = 1, dp(0,1) = dp(0,0) + s[1] == s[0],
     
     状态转移：dp(i,j)
        dp(i,i) = 1
        dp(i,i+1) = s[i] == s[i+1] ? 2 : 0
     如果s[i] == s[j], dp(i,j) = dp(i-1, j-1) + 2
     否则 dp(i,j) = 0
     */

    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return "" }
        var maxV = 0
        let str = Array(s)
        let count_1 = str.count - 1
        var ans = [String.Element]()
        ans.append(str[0])
        var dp = Array.init(repeating: Array.init(repeating: 0, count: str.count), count: str.count)
        for i in 0..<count_1 {
            for j in i+1...count_1 {
                if i == j {
                    dp[i][i] = 1
                }else if i + 1 == j {
                    dp[i][j] = str[i] == str[j] ? 2 : 0
                }else if str[i] == str[j] {
                    dp[i][j] = dp[i+1][j-1] + 2
                } else {
                    dp[i][j] = 0
                }
                if dp[i][j] > maxV {
                    maxV = dp[i][j]
                    ans = Array(str[i...j])
                }
            }
        }
        
        return String(ans)
    }
}



import XCTest

extension XCTestCase {
    
    func testLongestPalindrome() {
        let s = Solution()
        
        assert(s.longestPalindrome("babad") == "bab")
        assert(s.longestPalindrome("cbbd") == "bb")
        assert(s.longestPalindrome("cd") == "c")
        assert(s.longestPalindrome("c") == "c")

    }
}
