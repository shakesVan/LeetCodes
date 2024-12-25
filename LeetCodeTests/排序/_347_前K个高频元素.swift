//
//  _347_前K个高频元素.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/4.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var map: [Int: (key: Int, count: Int)] = [:]
    for num in nums {
        if let tuple = map[num] {
            map[num] = (tuple.key, tuple.count + 1)
        } else {
            map[num] = (num, 1)
        }
    }
    
    let sortValues = map.values.sorted {
        $0.count > $1.count
    }
    
    var result = [Int]()
    let count = min(k, sortValues.count)
    for i in 0..<count {
        result.append(sortValues[i].key)
    }
    return result
}



func topKFrequent1(_ nums: [Int], _ k: Int) -> [Int] {
    var sortNums = nums.sorted()
    var arrList = [[Int]]()
    
    for num in sortNums {
        if arrList.last?.last == num {
            arrList[arrList.count - 1].append(num)
        } else {
            arrList.append([num])
        }
    }
    let sortArrList = arrList.sorted {
        $0.count > $1.count
    }
    
    var result = [Int]()
    let count = min(k, sortArrList.count)
    for i in 0..<count {
        guard let tmp = sortArrList[i].first else {
            print("数据异常，i = \(i), sortArrList = \(sortArrList)")
            continue
        }
        result.append(tmp)
    }
    
    return result
}
