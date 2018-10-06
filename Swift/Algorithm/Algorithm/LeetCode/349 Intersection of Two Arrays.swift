//
//  349 Intersection of Two Arrays.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/12.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class P349 {
    class Solution {
        func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            let a = Set(nums1)
            return Array(a.intersection(nums2))
        }
    }

}
