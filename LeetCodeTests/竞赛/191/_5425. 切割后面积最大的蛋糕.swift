//
//  _5425. 切割后面积最大的蛋糕.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/31.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

private
class Solution {
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        
        var maxH = 1
        var maxV = 1
        var hs = horizontalCuts.sorted()
        hs.insert(0, at: 0)
        hs.append(h)
        var vs = verticalCuts.sorted()
        vs.insert(0, at: 0)
        vs.append(w)
        
        for i in 1..<hs.count {
            let tmp = hs[i] - hs[i-1]
            if tmp > maxH {
                maxH = tmp
            }
        }
        
        for i in 1..<vs.count {
            let tmp = vs[i] - vs[i-1]
            if tmp > maxV {
                maxV = tmp
            }
        }
        var ans = maxV * maxH
        if ans > Int((10e8 + 7)) {
            ans %= (Int(10e8 + 7))
        }
        return ans
    }
}


import XCTest

extension XCTestCase {
    func testmaxArea() {
        let s = Solution()
        var h = 5, w = 4, horizontalCuts = [1,2,4], verticalCuts = [1,3]
        
//        assert(s.maxArea(h, w, horizontalCuts, verticalCuts) == 4)
//
//        h = 5
//        w = 4
//        horizontalCuts = [3,1]
//        verticalCuts = [1]
//        assert(s.maxArea(h, w, horizontalCuts, verticalCuts) == 6)
//
//        h = 5
//        w = 4
//        horizontalCuts = [3]
//        verticalCuts = [3]
//        assert(s.maxArea(h, w, horizontalCuts, verticalCuts) == 9)
//
//        h = 6
//        w = 5
//        verticalCuts = [5]
//        horizontalCuts = [2,1,4]
//
//        assert(s.maxArea(h, w, horizontalCuts, verticalCuts) == 10)
        
        
        h = 1_0000_0000
        w = 1_0000_0000
        verticalCuts = [5]
        horizontalCuts = [2,1,4]
        
        assert(s.maxArea(h, w, horizontalCuts, verticalCuts) == 10)
    }
}
