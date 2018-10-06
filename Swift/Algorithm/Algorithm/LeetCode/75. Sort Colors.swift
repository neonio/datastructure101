//
//  75. Sort Colors.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/18.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class P75 {
    class Solution {
        //或者使用三路快排的思路
        func sortColors(_ nums: inout [Int]) {
            var zeroCount:Int = 0
            var oneCount:Int = 0
            var twoCount:Int = 0
            for num in nums {
                if num < 1 {
                    zeroCount += 1
                }else if num == 1 {
                    oneCount += 1
                }else{
                    twoCount += 1
                }
            }
            nums = [Int](repeating: 0, count: zeroCount) + [Int](repeating: 1, count: oneCount) + [Int](repeating: 2, count: twoCount)
        }
    }
}
