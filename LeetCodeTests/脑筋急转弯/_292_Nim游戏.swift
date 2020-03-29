//
//  _292_Nim 游戏.swift
//  LeetCodeTests
//
//  Created by 范摇 on 2020/3/24.
//  Copyright © 2020 范摇. All rights reserved.
//

import Foundation

func canWinNim(_ n: Int) -> Bool {
    
    return (n - 1) & 0x100
}


