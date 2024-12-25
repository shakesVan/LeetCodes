//
//  _2241_设计一个ATM机器.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/10/25.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

class ATM {

    
    fileprivate let banknotesList: [Int] = [20, 50, 100, 200, 500]
    fileprivate var banknotesCountMap: [Int: Int] = [:]
    
    init() {
        
    }
    
    // 存入钞票[20, 50, 100, 200, 500]的各自数量
    func deposit(_ banknotesCount: [Int]) {
        if banknotesCount.count != banknotesList.count {
            print("存入异常 banknotesCount=\(banknotesCount), 其长度不为\(banknotesList.count)")
            return
        }
        
        for i in 0..<banknotesList.count {
            let banknotes = banknotesList[i]
            let banknotesConut = banknotesCount[i]
            if banknotesCountMap[banknotes] == nil {
                banknotesCountMap[banknotes] = 0
            }
            
            banknotesCountMap[banknotes] = (banknotesCountMap[banknotes] ?? 0) + banknotesConut
            
        }
        
        print("deposit banknotesCountMap == \(banknotesCountMap)")
    }
    
    // 取出指定金额钞票，返回[20, 50, 100, 200, 500]的各自数量
    func withdraw(_ amount: Int) -> [Int] {
        let reversedList = [Int](banknotesList.reversed())
        var list = [Int].init(repeating: 0, count: reversedList.count)
        var tmpAmount = amount
        
        var tmpMap = banknotesCountMap
        for i in 0..<reversedList.count {
            let banknotes = reversedList[i]
            let needCount = tmpAmount / banknotes
            
            guard let count = tmpMap[banknotes] else {
                return [-1]
            }
            
            
            let resultCount: Int = needCount <= count ? needCount : count
            
            list[i] = resultCount
            tmpMap[banknotes] = (tmpMap[banknotes] ?? 0) - resultCount
            tmpAmount -= banknotes * resultCount
            
        }
        if tmpAmount != 0 {
            // 找不到
            return [-1]
        }
        print("withdraw tmpMap == \(tmpMap), banknotesCountMap == \(banknotesCountMap)")
        banknotesCountMap = tmpMap
        return [Int](list.reversed())
    }
}

/**
 * Your ATM object will be instantiated and called as such:
 * let obj = ATM()
 * obj.deposit(banknotesCount)
 * let ret_2: [Int] = obj.withdraw(amount)
 */
