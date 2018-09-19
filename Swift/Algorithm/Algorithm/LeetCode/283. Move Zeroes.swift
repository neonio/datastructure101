//
//  283. Move Zeroes.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/18.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var noneZeroIndex = 0 // 0..< data[noneZeroIndex] == 0
        for (index, item) in nums.enumerated() {
            if item != 0 {
                nums.swapAt(index, noneZeroIndex)
                noneZeroIndex += 1
            }
        }
        for i in noneZeroIndex..<nums.count {
            nums[i] = 0
        }
    }
}
