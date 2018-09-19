//
//  26. Remove Duplicates from Sorted Array.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/18.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var numSet = Set<Int>()
        var setCount = 0
        var result:[Int] = []
        for num in nums {
            numSet.insert(num)
            if setCount != numSet.count {
                setCount += 1
                result.append(num)
            }
        }
        nums = result
        return setCount
    }
}
