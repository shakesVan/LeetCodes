//
//  快速排序.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/6/4.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation


func queckSort(_ array: inout Array<Int>, _ begin: Int, _ end: Int){
    if end - begin <= 1 { return }
    let index = getIndex(&array, begin, end)
    queckSort(&array, begin, index)
    queckSort(&array, index+1, end)
    
}

//[begin, end)
func getIndex(_ array: inout Array<Int>, _ begin: Int, _ end: Int) -> Int {
    var begin = begin
    var end = end - 1
    
    
    let index = Int(arc4random()) % (end - begin + 1) + begin
    
    let tmp = array[index]
    array[index] = array[begin]
    array[begin] = tmp
    
    while begin < end {
        
        while begin < end {
            if array[end] > tmp {
                end -= 1
            }else {
                // 换向
                array[begin] = array[end]
                begin += 1
                break
            }
        }
        
        while begin < end {
            if array[begin] < tmp {
                begin += 1
            }else {
                // 换向
                array[end] = array[begin]
                end -= 1
                break
            }
        }
    }
    array[begin] = tmp
    return begin
}

func randomIn(_ min: Int, max: Int) -> Int {
    return Int(arc4random()) % (max - min + 1) + min
}

import XCTest

extension XCTestCase {
    func testQueckSort() {
        var arr = [3,2,4,1,7,3,4,6,1,6]
        queckSort(&arr, 0, arr.count)
        assert(arr == [1,1, 2,3,3,4,4,6,6,7])
    }
}
