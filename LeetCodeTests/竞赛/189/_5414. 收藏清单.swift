//
//  _5414. 收藏清单.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/5/17.
//  Copyright © 2020 范摇. All rights reserved.
// https://leetcode-cn.com/contest/weekly-contest-189/problems/people-whose-list-of-favorite-companies-is-not-a-subset-of-another-list/

import Foundation
private
class Solution {
    func peopleIndexes(_ favoriteCompanies: [[String]]) -> [Int] {
        
        var map = Dictionary<Set<String>, Int>()
        let sets = favoriteCompanies.map { Set($0) }
        
        var ansMap = Dictionary<Set<String>, Int>()
        let sort = sets.sorted(by: { $0.count > $1.count})
        for i in 0..<sets.count {
            map[sets[i]] = i
        }
        for i in 0..<sort.count {
            var flag = false
            
            for key in ansMap.keys {
                if sort[i].isSubset(of: key) {
                    flag = true
                    break
                }
            }
            if !flag { ansMap[sort[i]] = map[sort[i]] }
        }
        return ansMap.values.sorted()
    }
}

import XCTest

extension XCTestCase {
    func testPeopleIndexes() {
        let s = Solution()
        var favoriteCompanies = [["leetcode","google","facebook"],["google","microsoft"],["google","facebook"],["google"],["amazon"]]
//        assert(s.peopleIndexes(favoriteCompanies) == [0,1,4])
//        favoriteCompanies = [["leetcode","google","facebook"],["leetcode","amazon"],["facebook","google"]]
//
//        assert(s.peopleIndexes(favoriteCompanies) == [0,1] )
//
//        favoriteCompanies = [["leetcode"],["google"],["facebook"],["amazon"]]
//        assert(s.peopleIndexes(favoriteCompanies) == [0,1,2,3])
        
        
       favoriteCompanies =  [["arrtztkotazhufrsfczr","knzgidixqgtnahamebxf","zibvccaoayyihidztflj"],["cffiqfviuwjowkppdajm","owqvnrhuzwqohquamvsz"],["knzgidixqgtnahamebxf","owqvnrhuzwqohquamvsz","qzeqyrgnbplsrgqnplnl"],["arrtztkotazhufrsfczr","cffiqfviuwjowkppdajm"],["arrtztkotazhufrsfczr","knzgidixqgtnahamebxf","owqvnrhuzwqohquamvsz","qzeqyrgnbplsrgqnplnl","zibvccaoayyihidztflj"]]
        
        assert(s.peopleIndexes(favoriteCompanies) == [1,3,4])
    }
}
