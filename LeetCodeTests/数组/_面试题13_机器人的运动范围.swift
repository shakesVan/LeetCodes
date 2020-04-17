//
//  _面试题13_机器人的运动范围.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/8.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

/*
失败
 
1 <= n,m <= 100
0 <= k <= 20
*/
/*
 0,0 0,1 0,2 0,3
 1,0 1,1 1,2 1,3
 2,0 2,1 2,2 2,3
 3,0 3,1 3,2 3,3
 
 
 i % 10 + i / 10 + j % 10 + j / 10 <= k
 
 i % 10 + i / 10 <= k / 2
 
 99 % 10 + 99 / 10 <= k /
 9 + 9 = 18 <= k/2
 k >= 36
 
 k = 20
 i % 10 + i / 10 == 10 => i == 55
 j = 55
 
 99 22
 100 , 100
 
 
 
 mn
 
 n + m <= k
 (m + n) 10 =
 10 * n + m * 10 <= 10 * k
 i % 10 + i / 10 <= k
 (i % 10) * 10 + i  <= 10 * k
 
 
 
  
 
 满足这个不等式所有的i 和 k
 
k  max
0  0
1  10 100
2  20 100
3  30 100   01 02 03 10 20 30
 
 
9  9
10 10
 
*/

func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
    var count = k
    if k >= 10 {
        count = 9
    }
    
//    let countm = min(count, m % 10)
//
//    let countn = min(count, n % 10)
    
    var sum = 0
    
    for mi in 0...m/10 {
        for mj in 0...m%10 {
            for ni in 0...n/10 {
                for nj in 0...n%10 {
                    if mi + ni + mj + nj <= k {
                        sum += 1
                        print("mi + ni + mj + nj = \(mi) + \(ni) + \(mj) + \(nj)")
                    }
                }
            }
        }
    }
    print("sum = \(sum)")
    
    return sum
}

import XCTest

extension XCTestCase {
    
    func testMovingCount() {
        
        assert(movingCount(2, 3, 1) == 3)
        assert(movingCount(1, 2, 1) == 2)
        assert(movingCount(3, 1, 0) == 1)
    }
}
