//
//  _2731_移动机器人.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/29.
//  Copyright © 2024 范摇. All rights reserved.
//

/**
 
 
 // Sum(n): 从0开始到n，所有数据总和

 Sum(n) = num(n) + num(n-1) +num(n-2) + … + num(0)

 // dp(n): 以n为结尾的所有距离总和

 dp(0) = num(0) = 0

 dp(1) = num(1) - num(0) = num(1)

 dp(2)= (num(2) - num(1)) + (num(2) - num(0)) = num(2) * 2 - (num(1) + num(0))

 dp(3)=  (num(3) - num(2)) + (num(3) - num(1)) + (num(3) - num(0)) = num(3)*3 - (num(2) + num(1) + num(0))

 ...

 dp(n) = (num(n) - num(n-1) + (num(n) - num(n-2))) + .. (num(n) - num(0))

          = num(n) * n - (num(n-1) + num(n-2) + … num(1) + num(0))

          = num(n) * n - (Sum(n) - num(n))

          = num(n) * (n + 1) - Sum(n)



 dp(0) = 0

 dp(1) = 1 * 1 - (0)  = 1

 dp(2) = 2 * 2 - (1 + 0)  = 3

 dp(3) = 4 * 3 - (2 + 1 + 0) = 12 - 3 = 9



 S0 = dp(0)

 S1 = dp(1) + S0

 S2 = dp(2) + S1

 ...

 // S(n): n个数据的所有距离总和

 Sn = dp(n) + S(n-1) = dp(n) + dp(n-1) + dp(n-2) + … + dp(1) + dp(0)

       = num(n) * (n + 1) + num(n-1) * n + … + num(1) * 2 + num(0) * 1 - (Sum(n) + Sum(n-1) + … + Sum(1) + Sum(0))

      = num(n) * (n + 1) + num(n-1) * n + num(n-2) * (n - 1)  … + num(1) * 2 + num(0) * 1 -

     (num(n) * 1 + num(n-1) * 2 + num(n-2) * 3 + … + num(1) * (n) + num(0) * (n + 1))

     = num(n) * ((n + 1) - 1) + num(n-1) * (n  - 2) + num(n-2) * ((n - 1) - 3)  + … +  num(1) * (2 - n)  + num(0) * (1 - (n + 1))

 = num(n) * (n) + num(n-1) * (n  - (2 * 1) + num(n-2) * ((n - 2 * 2)  + … +  num(1) * (n  - 2 * (n - 1)  + num(0) * (n - 2 * (n))



 // T(n): Sum(0) 加到Sum(n)的总和，该变量用于简化

 Tn =  Sum(n) + Sum(n-1) + … + Sum(1) + Sum(0)

 T(n-1) =  Sum(n-1) + … + Sum(1) + Sum(0)

 ...

 T1 = Sum(1) + Sum(0)

 T0 = Sum(0)



 Tn = T(n-1) + Sum(n) = T(n-1) + num(n) + num(n-1) + num(n-2) + … + num(1) + num(0)

 T(n-1) = T(n-2) + num(n-1) + num(n-2) + … + num(1) + num(0)

 T(n-2) = T(n-1) + num(n-2) + num(n-3) + … + num(1) + num(0)



 Tn = num(n) + num(n-1) * 2 + num(n-2) * 3 + … + num(1) * (n) + num(0) * (n + 1)

 
 */

import Foundation

let kResultMax: Int64 = 10_0000_0007


func sumDistance(_ nums: [Int], _ s: String, _ d: Int) -> Int {
 
    let list: [Character] = Array(s)
    
    guard nums.count == list.count,
          nums.count != 0 else {
        return 0
    }
    
    // 获取最新的位置数组
    var newNums = [Int]()
    var min = Int.max
    for i in 0..<nums.count {
        let char = list[i]
        let num = nums[i]
        
        if !(char == "R" || char == "L") {
            print("字符串异常 char = \(char), s = \(s)")
            return 0
        }
        let newNum: Int
        if char == "R" {
            newNum = num + d
        } else {
            newNum = num - d
        }
        if newNum < min {
            min = newNum
        }
        newNums.append(newNum)
    }
    newNums = newNums.map {
        $0 - min
    }.sorted(by: <)
    print("newNums == \(newNums)")
    // 计算两两的距离
    var result: Int64 = 0
    let n = newNums.count - 1
    for i in 0...n {
        // 公式由来见上方注释
        let tmp: Int64 = Int64(newNums[i]) * Int64(n - 2 * (n - i))
        result += tmp
        if result > kResultMax {
            result = result % kResultMax
        }
        print("result == \(result),for \(i), tmp == \(tmp)")
    }
    
    print("result == \(result),for end")
    
    return Int(result)
    
}




func sumDistance1(_ nums: [Int], _ s: String, _ d: Int) -> Int {
 
    let list: [Character] = Array(s)
    
    guard nums.count == list.count,
          nums.count != 0 else {
        return 0
    }
    
    // 获取最新的位置数组
    var newNums = [Int]()
    for i in 0..<nums.count {
        let char = list[i]
        let num = nums[i]
        
        if !(char == "R" || char == "L") {
            print("字符串异常 char = \(char), s = \(s)")
            return 0
        }
        
        if char == "R" {
            newNums.append(num + d)
        } else {
            newNums.append(num - d)
        }
    }
    
    // 计算两两的距离
    var result = 0
    
    for i in 0..<newNums.count {
        for j in i..<newNums.count {
            result += abs(newNums[i] - newNums[j])
        }
    }
    
    if result > Int(kResultMax) {
        result = result % Int(kResultMax)
    }
    
    return result
    
}

