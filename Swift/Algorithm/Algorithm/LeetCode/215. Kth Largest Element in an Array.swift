//
//  215. Kth Largest Element in an Array.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/18.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let newNums = nums
        return newNums.sorted(by: >)[k - 1]
    }

}


