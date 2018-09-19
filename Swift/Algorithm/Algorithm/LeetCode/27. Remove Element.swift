//
//  27. Remove Element.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/18.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter{$0 != val}
        return nums.count
    }
}
