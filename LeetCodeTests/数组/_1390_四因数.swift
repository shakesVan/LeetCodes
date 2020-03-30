//
//  _1390_四因数.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/24.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
import XCTest

 func sumFourDivisors(_ nums: [Int]) -> Int {
    var sum = 0;
    for i in 0..<nums.count {
        sum += getFourDivisorsSum(nums[i])
    }
    return sum
}

func getFourDivisorsSum(_ num: Int) -> Int {
    guard num > 5  else {
        return 0
    }
    var dn = 0
    var fi = 1
    
    for i in 2..<Int(sqrt(Double(num))) {
        if num % i == 0 {
            dn += 1
            fi = i
        }
    }
    
//    print("num = \(num), dn = \(dn), fi = \(fi)")
    guard dn == 2 else {
        return 0
    }
    return 1 + fi + num / fi + num
    
}



extension XCTestCase {

    
    func testSumFourDivisors() {
        let nums1 = [21, 4, 7]
        let nums2 = [21, 4, 7, 8]
        let nums3 = [21, 4, 7, 8, 16]
        let nums4 = [1,2,3,4,5]
        
        print(sumFourDivisors(nums1))
        print(sumFourDivisors(nums2))
        print(sumFourDivisors(nums3))
        assert(sumFourDivisors(nums1) == 32)
        
        assert(sumFourDivisors(nums2) == 47)
        assert(sumFourDivisors(nums3) == 47)
        
        assert(sumFourDivisors(nums4) == 0)
        // (134.100 seconds).
//        assert(sumFourDivisors(XCTestCase.bigNums) == 135341358)
    }
    
    
}


