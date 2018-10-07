//
//  198. House Robber.swift
//  Algorithm
//
//  Created by amoyio on 2018/10/7.
//  Copyright © 2018 amoyio. All rights reserved.
//

import Foundation
class P198 {
    class Solution {
        func rob(_ nums: [Int]) -> Int {
            guard nums.count > 0 else {return 0}
            var opts:[Int] = [Int](repeating: -1, count: nums.count)
            // break condition
            opts[0] = nums[0]
            guard nums.count > 1 else {return nums[0]}
            opts[1] = max(nums[0], nums[1])
            for i in 2..<nums.count {
                // choose
                let optA = opts[i - 2] + nums[i]
                // not choose
                let optB = opts[i - 1]
                opts[i] = max(optA, optB)
            }
            return opts.last ?? 0
        }
    }
}
