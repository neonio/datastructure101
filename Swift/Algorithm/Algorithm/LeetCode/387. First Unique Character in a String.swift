//
//  387. First Unique Character in a String.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/15.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var list:[Int] = [Int](repeating: 0, count: 26)
        for charCode in s.unicodeScalars {
            let tempIndex:Int = Int(charCode.value) - 97
            list[tempIndex] += 1
        }
        
        var index = 0
        for charCode in s.unicodeScalars {
            let tempIndex:Int = Int(charCode.value) - 97
            if list[tempIndex] == 1 {
                return index
            }
            index += 1
        }
        return -1
    }
}
