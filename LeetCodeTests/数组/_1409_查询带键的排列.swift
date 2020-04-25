//
//  _1409_查询带键的排列.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/18.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation
import XCTest

func processQueries(_ queries: [Int], _ m: Int) -> [Int] {
    // 创建数组
    var list = Array(1...m)
    var indexList = [Int]()
    // 遍历queries中的每个元素
    for item in queries {
        // 找到与item相等的list中的数，取得下标
        for i in 0..<m where item == list[i]  {
            // 先删除再插入，不然位置会变
            list.remove(at: i)
            list.insert(item, at: 0)
            indexList.append(i)
            break
        }
    }
    
    return indexList
}

extension XCTestCase {
    func testProcessQueries() {
        assert(processQueries([3,1,2,1], 5) == [2,1,2,1])
        
        assert(processQueries([4,1,2,2], 4) == [3,1,2,0])
        
        assert(processQueries([7,5,5,8,3], 8) == [6,5,0,7,5])
    }
}

