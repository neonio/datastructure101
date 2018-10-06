//
//  88. Merge Sorted Array.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/18.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
class P88 {
    class Solution {
        func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            var result:[Int] = []
            var num1Index:Int = 0
            var num2Index:Int = 0
            while true {
                if num1Index >= m {
                    result.append(contentsOf: nums2[num2Index..<n])
                    break
                }
                if num2Index >= n {
                    result.append(contentsOf: nums1[num1Index..<m])
                    break
                }
                if nums1[num1Index] < nums2[num2Index] {
                    result.append(nums1[num1Index])
                    num1Index += 1
                }else{
                    result.append(nums2[num2Index])
                    num2Index += 1
                }
            }
            nums1 = result
        }
    }
}
