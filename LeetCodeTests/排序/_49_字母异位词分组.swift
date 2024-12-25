//
//  _49_字母异位词分组.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2024/11/4.
//  Copyright © 2024 范摇. All rights reserved.
//

import Foundation

func groupAnagrams(_ strs: [String]) -> [[String]] {

    var map = [String: [String]]()
    var keys = [String]()
    for str in strs {
        // 排序为key
        let sort = String(str.sorted())
        // 找到就拼接，未找到就初始化
        if let _ = map[sort] {
            map[sort]?.append(str)
        } else {
            map[sort] = [str]
            keys.append(sort)
        }
    }
    var result = [[String]]()
    for key in keys {
        result.append(map[key] ?? [])
    }
    return result
}

