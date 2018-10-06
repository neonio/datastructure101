//
//  80. Remove Duplicates from Sorted Array II.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/18.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class P80 {
    class Solution {
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            var set:Set<Int> = Set<Int>()
            var setCount:Int = 0
            var result:[Int] = []
            var tempSet:Set<Int> = Set<Int>()
            var tempCount:Int = 0
            for num in nums {
                set.insert(num)
                if setCount != set.count {
                    setCount += 1
                    result.append(num)
                }else{
                    tempSet.insert(num)
                    if tempCount != tempSet.count {
                        tempCount += 1
                        result.append(num)
                    }
                }
            }
            nums = result
            return result.count
        }
    }
}
