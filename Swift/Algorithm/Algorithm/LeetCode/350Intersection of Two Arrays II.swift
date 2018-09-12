//
//  350Intersection of Two Arrays II.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/12.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
fileprivate class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var a:[Int:Int] = [:]
        for item in nums1 {
            let value = (a[item] ?? 0) + 1
            a[item] = value
        }
        var result:[Int] = []
        for item in nums2 {
            if let aItem = a[item] {
                if aItem > 1 {
                    result.append(item)
                    a[item] = aItem - 1
                }else{
                    a.removeValue(forKey: item)
                }
            }
        }
        
        return result
    }
}
