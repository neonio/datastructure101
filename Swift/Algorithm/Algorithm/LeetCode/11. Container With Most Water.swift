//
//  11. Container With Most Water.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/19.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left:Int = 0
        var right:Int = height.count - 1
        var ans = 0
        while left < right {
            ans = max(ans, (right - left) * min(height[left], height[right]))
            if height[left] < height[right] {
                left += 1
            }else{
                right -= 1
            }
        }
        return ans
    }
}
