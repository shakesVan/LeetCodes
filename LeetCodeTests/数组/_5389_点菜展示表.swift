//
//  _5389_点菜展示表.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/4/19.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func displayTable(_ orders: [[String]]) -> [[String]] {
    var dict = [String: [String: Int]]() // [餐桌: [菜名: 数量]]
    var table: String
    var cname: String
    for items in orders {
        table = items[1]
        cname = items[2]
        if dict[table] == nil {
            dict[table] = [String: Int]()
        }
        if dict[table]![cname] == nil {
            dict[table]![cname] = Int()
        }
        dict[table]![cname]! += 1
        
    }
//    print("dict == \(dict)")
    // 桌号
    let keys = dict.keys.sorted {
        (Int($0) ?? 0) <= (Int($1) ?? 0)
    }
    var set = Set<String>()
    for table in keys {
        let menu = dict[table]!
        for m in menu {
            set.insert(m.key)
        }
    }
    var heads = set.sorted()
    heads.insert("Table", at: 0)
    var result = [heads]
    var item: [String]
    //先取出桌号
    for table in keys {
        item = [table]
        // 取出菜单对应的数量
        for i in 1..<heads.count {
            item.append(String(dict[table]![heads[i]] ?? 0))
        }
        result.append(item)
    }

//    print(result)
    return result;
}

import XCTest

extension XCTestCase {
    func testDisplayTable() {
        let order1 = [["David","3","Ceviche"],["Corina","10","Beef Burrito"],["David","3","Fried Chicken"],["Carla","5","Water"],["Carla","5","Ceviche"],["Rous","3","Ceviche"]]
        let order2 = [["James","12","Fried Chicken"],["Ratesh","12","Fried Chicken"],["Amadeus","12","Fried Chicken"],["Adam","1","Canadian Waffles"],["Brianna","1","Canadian Waffles"]]
        let order3 = [["Laura","2","Bean Burrito"],["Jhon","2","Beef Burrito"],["Melissa","2","Soda"]]

        assert(displayTable(order1).count == 4)
        assert(displayTable(order2).count == 3)
        
        assert(displayTable(order3).count == 2)
    }
}
